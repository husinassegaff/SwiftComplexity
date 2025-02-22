import SwiftUI

@MainActor
class QuizViewModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var userAnswers: [String: String] = [:]
    @Published var showResult = false
    @Published var score = 0
    @Published var isQuizCompleted = false
    @Published var selectedComplexity: String?
    @Published var feedback: FeedbackState?
    
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
    }
    
    func checkAnswer(for sectionId: UUID, answer: String) {
          userAnswers[sectionId.uuidString] = answer
          
          if let section = currentQuestion.sections.first(where: { section in
              section.id.uuidString == sectionId.uuidString
          }) {
              let isCorrect = answer == section.complexity
              if isCorrect {
                  score += 1
                  feedback = FeedbackState(
                      isCorrect: true,
                      message: "Correct! Well done!",
                      explanation: section.explanation,
                      correctAnswer: section.complexity
                  )
              } else {
                  feedback = FeedbackState(
                      isCorrect: false,
                      message: "Not quite right. Let's understand why:",
                      explanation: section.explanation,
                      correctAnswer: section.complexity
                  )
              }
          }
          
          checkQuestionCompletion()
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
        }
    }
    
    func completeQuiz() {
        withAnimation {
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
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                feedback = nil
                if isLastQuestion {
                    completeQuiz()
                } else {
                    moveToNextQuestion()
                }
            }
        }
    }

}
