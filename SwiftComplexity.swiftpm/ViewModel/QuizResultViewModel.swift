import SwiftUI
import SwiftData

@MainActor
class QuizResultViewModel: ObservableObject {
    @Published var highScores: [Difficulty: QuizResult] = [:]
    @Published var allResults: [QuizResult] = []
    @Published var selectedDifficulty: Difficulty = .easy
    private var context: ModelContext?
    
    func setContext(context: ModelContext) {
        self.context = context
    }
    
    func saveQuizResult(score: Int, totalQuestions: Int, difficulty: Difficulty, completionTime: TimeInterval) {
        guard let context = context else { return }
        
        let newResult = QuizResult(
            score: score,
            totalQuestions: totalQuestions,
            difficulty: difficulty,
            completionTime: completionTime
        )
        
        context.insert(newResult)
        try? context.save()
        fetchResults()
    }
    
    func fetchResults() {
        guard let context = context else { return }
        
        do {
            let descriptor = FetchDescriptor<QuizResult>()
            allResults = try context.fetch(descriptor)
            updateHighScores()
        } catch {
            print("Failed to fetch quiz results: \(error)")
        }
    }
    
    private func updateHighScores() {
        let resultsByDifficulty = Dictionary(grouping: allResults) { $0.difficulty }
        
        for difficulty in Difficulty.allCases {
            if let results = resultsByDifficulty[difficulty] {
                let bestResult = results.sorted { first, second in
                    if first.scorePercentage == second.scorePercentage {
                        return first.completionTime < second.completionTime
                    }
                    return first.scorePercentage > second.scorePercentage
                }.first
                
                highScores[difficulty] = bestResult
            }
        }
    }
    
    func resultsForDifficulty(_ difficulty: Difficulty) -> [QuizResult] {
        return allResults
            .filter { $0.difficulty == difficulty }
            .sorted { $0.dateCompleted > $1.dateCompleted }
    }
}
