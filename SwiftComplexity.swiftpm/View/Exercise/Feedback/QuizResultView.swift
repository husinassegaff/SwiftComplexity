import SwiftUI

struct QuizResultView: View {
    @ObservedObject var viewModel: QuizViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Quiz Completed!")
                    .font(.title)
                    .bold()
                
                let score = viewModel.calculateFinalScore()
                Text("Your Score: \(score.score)/\(score.total)")
                    .font(.title2)
                
                Text("\(Int(score.percentage))%")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(score.percentage >= 70 ? .green : .orange)
                
                Text("Time: \(viewModel.formattedTime)")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}
