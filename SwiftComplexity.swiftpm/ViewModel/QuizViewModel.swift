import SwiftUI
@preconcurrency import Combine

@MainActor
class QuizViewModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var userAnswers: [String: String] = [:]
    @Published var showResult = false
    @Published var score = 0
    @Published var isQuizCompleted = false
    @Published var selectedComplexity: String?
    @Published var feedback: FeedbackState?
    @Published var elapsedTime: TimeInterval = 0
    
    private var timerCancellable: AnyCancellable?
    private var startTime: Date?
    private let difficulty: Difficulty
    private var questions: [QuizQuestion]
    
    var questionCount: Int {
        questions.count
    }
    
    var currentQuestion: QuizQuestion {
        questions[currentQuestionIndex]
    }
    
    var progress: Double {
        Double(currentQuestionIndex + 1) / Double(questions.count)
    }
    
    var isLastQuestion: Bool {
        currentQuestionIndex == questions.count - 1
    }
    
    var formattedTime: String {
        let hours = Int(elapsedTime) / 3600
        let minutes = Int(elapsedTime) / 60 % 60
        let seconds = Int(elapsedTime) % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        
        switch difficulty {
        case .easy:
            self.questions = easyQuestions
        case .medium:
            self.questions = mediumQuestions
        case .hard:
            self.questions = hardQuestions
        }
        
        startTimer()
    }
    
    private func startTimer() {
        startTime = Date()
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self,
                      let startTime = self.startTime else { return }
                self.elapsedTime = Date().timeIntervalSince(startTime)
            }
    }
    
    private func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
    
    func checkAnswer(for sectionId: UUID, answer: String) {
        userAnswers[sectionId.uuidString] = answer
        
        let isCorrect = answer == currentQuestion.expectedComplexity
        if isCorrect {
            score += 1
            feedback = FeedbackState(
                isCorrect: true,
                message: "Correct! Well done!",
                explanation: currentQuestion.explanation,
                correctAnswer: currentQuestion.expectedComplexity
            )
        } else {
            feedback = FeedbackState(
                isCorrect: false,
                message: "Not quite right",
                explanation: currentQuestion.explanation,
                correctAnswer: currentQuestion.expectedComplexity
            )
        }
        
        if isLastQuestion {
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 1_500_000_000) // 1.5 second delay
                completeQuiz()
            }
        } else {
            checkQuestionCompletion()
        }
    }
    
    func moveToNextQuestion() {
        withAnimation {
            currentQuestionIndex += 1
            selectedComplexity = nil
            feedback = nil
        }
    }
    
    func restartQuiz() {
        withAnimation {
            currentQuestionIndex = 0
            userAnswers.removeAll()
            score = 0
            isQuizCompleted = false
            selectedComplexity = nil
            feedback = nil
            stopTimer()
            elapsedTime = 0
            startTimer()
        }
    }
    
    func completeQuiz() {
        withAnimation {
            stopTimer()
            isQuizCompleted = true
            showResult = true
        }
    }
    
    func hasAnswered(sectionId: UUID) -> Bool {
        userAnswers[sectionId.uuidString] != nil
    }
    
    func getAnswer(for sectionId: UUID) -> String? {
        userAnswers[sectionId.uuidString]
    }
    
    func calculateFinalScore() -> (score: Int, total: Int, percentage: Double) {
        let totalPossiblePoints = questions.reduce(0) { $0 + $1.sections.count }
        let percentage = (Double(score) / Double(totalPossiblePoints)) * 100
        return (score, totalPossiblePoints, percentage)
    }
    
    private func checkQuestionCompletion() {
        let answeredSections = currentQuestion.sections.filter { section in
            userAnswers[section.id.uuidString] != nil
        }
        
        if answeredSections.count == currentQuestion.sections.count {
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                feedback = nil
                moveToNextQuestion()
            }
        }
    }
    
    deinit {
        if let timerCancellable = timerCancellable {
            timerCancellable.cancel()
            self.timerCancellable = nil
        }
    }
}
