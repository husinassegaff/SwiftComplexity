import SwiftUI

struct FeedbackView: View {
    let feedback: FeedbackState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: feedback.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                Text(feedback.message)
                    .bold()
            }
            .foregroundColor(feedback.isCorrect ? .green : .red)
            
            Text(feedback.explanation)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemBackground))
                .shadow(radius: 2)
        )
    }
}
