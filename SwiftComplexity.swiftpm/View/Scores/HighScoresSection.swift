import SwiftUI

struct HighScoresSection: View {
    let highScores: [Difficulty: QuizResult]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("High Scores")
                .font(.title2)
                .bold()
            
            ForEach(Difficulty.allCases, id: \.self) { difficulty in
                HighScoreRow(
                    difficulty: difficulty,
                    result: highScores[difficulty]
                )
            }
        }
    }
}
