import SwiftUI

struct FeedbackView: View {
    let feedback: FeedbackState
    let question: QuizQuestion
    @State private var showDetailedFeedback = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: feedback.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                Text(feedback.message)
                    .bold()
                Spacer()
            }
            .foregroundColor(feedback.isCorrect ? .green : .red)
            
            HStack {
                Spacer()
                Button {
                    showDetailedFeedback = true
                } label: {
                    Label("View Analysis", systemImage: "chart.bar.doc.horizontal")
                }
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemBackground))
                .shadow(radius: 2)
        )
        .padding(.horizontal)
        .fullScreenCover(isPresented: $showDetailedFeedback) {
            DetailedFeedbackView(question: question, feedback: feedback)
        }
    }
}
