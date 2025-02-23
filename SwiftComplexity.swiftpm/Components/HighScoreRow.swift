import SwiftUI

struct HighScoreRow: View {
    let difficulty: Difficulty
    let result: QuizResult?
    
    var body: some View {
        HStack {
            Text(difficulty.rawValue)
                .font(.headline)
            
            Spacer()
            
            if let result = result {
                Text("\(Int(result.scorePercentage))%")
                    .bold()
                Text("•")
                    .foregroundColor(.secondary)
                Text(result.formattedTime)
                    .foregroundColor(.secondary)
            } else {
                Text("No attempts")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
