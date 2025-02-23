import Foundation
import SwiftData

@Model
class QuizResult: Identifiable {
    var id: UUID
    var score: Int
    var totalQuestions: Int
    private var difficultyRawValue: String
    var completionTime: TimeInterval
    var dateCompleted: Date
    
    var difficulty: Difficulty {
        get {
            Difficulty(rawValue: difficultyRawValue) ?? .easy
        }
        set {
            difficultyRawValue = newValue.rawValue
        }
    }
    
    init(id: UUID = UUID(),
         score: Int,
         totalQuestions: Int,
         difficulty: Difficulty,
         completionTime: TimeInterval,
         dateCompleted: Date = Date()) {
        self.id = id
        self.score = score
        self.totalQuestions = totalQuestions
        self.difficultyRawValue = difficulty.rawValue
        self.completionTime = completionTime
        self.dateCompleted = dateCompleted
    }
    
    var scorePercentage: Double {
        Double(score) / Double(totalQuestions) * 100
    }
    
    var formattedTime: String {
        let hours = Int(completionTime) / 3600
        let minutes = Int(completionTime) / 60 % 60
        let seconds = Int(completionTime) % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
