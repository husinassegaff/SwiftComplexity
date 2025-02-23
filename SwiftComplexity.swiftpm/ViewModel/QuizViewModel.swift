import SwiftUI
@preconcurrency import Combine

@MainActor
class QuizViewModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var showResult = false
    @Published var score = 0
    @Published var isQuizCompleted = false
    @Published var selectedComplexity: String?
    @Published var feedback: FeedbackState?
    @Published var elapsedTime: TimeInterval = 0
    @Published var showHint = false
    @Published var showTimePenalty = false
    @Published var timePenaltyAmount: Double = 0
    
    private var timerCancellable: AnyCancellable?
    private var startTime: Date?
    private var totalPenaltyTime: TimeInterval = 0
    private let difficulty: Difficulty
    private var questions: [QuizQuestion]
    private var answeredCorrectly: Set<Int> = []
    private var hintUsedForQuestions: Set<Int> = []
    
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
                self.elapsedTime = Date().timeIntervalSince(startTime) + self.totalPenaltyTime
            }
    }
    
    private func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
    
    func checkAnswer(for sectionId: UUID, answer: String) {
        let isCorrect = answer == currentQuestion.expectedComplexity
        
        if isCorrect && !answeredCorrectly.contains(currentQuestionIndex) {
            score += 1
            answeredCorrectly.insert(currentQuestionIndex)
        }
        
        feedback = FeedbackState(
            isCorrect: isCorrect,
            message: isCorrect ? "Correct! Well done!" : "Not quite right",
            explanation: currentQuestion.explanation,
            correctAnswer: currentQuestion.expectedComplexity
        )

        if isLastQuestion {
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                completeQuiz()
            }
        }
    }

    func moveToNextQuestion() {
        withAnimation {
            currentQuestionIndex += 1
            selectedComplexity = nil
            feedback = nil
            showHint = false
        }
    }
    
    func completeQuiz() {
        withAnimation {
            stopTimer()
            isQuizCompleted = true
            showResult = true
        }
    }
    
    func restartQuiz() {
        withAnimation {
            currentQuestionIndex = 0
            answeredCorrectly.removeAll()
            hintUsedForQuestions.removeAll()
            score = 0
            isQuizCompleted = false
            selectedComplexity = nil
            feedback = nil
            showHint = false
            stopTimer()
            elapsedTime = 0
            totalPenaltyTime = 0
            startTimer()
        }
    }
    
    func calculateFinalScore() -> (score: Int, total: Int, percentage: Double) {
        let totalPossiblePoints = questions.count
        let percentage = (Double(score) / Double(totalPossiblePoints)) * 100
        return (score, totalPossiblePoints, percentage)
    }
    
    func toggleHint() {
        showHint.toggle()
        
        if showHint && !hintUsedForQuestions.contains(currentQuestionIndex) {
            hintUsedForQuestions.insert(currentQuestionIndex)
            
            let penalty: Double
            switch difficulty {
            case .easy:
                penalty = 10
            case .medium:
                penalty = 15
            case .hard:
                penalty = 25
            }

            totalPenaltyTime += penalty
            timePenaltyAmount = penalty
            
            showTimePenalty = true
            
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                withAnimation {
                    self.showTimePenalty = false
                }
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
