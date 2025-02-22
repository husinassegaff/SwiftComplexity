import SwiftUI

struct QuestionHeaderView: View {
    let question: QuizQuestion
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question.title)
                .font(.title2)
                .bold()
            
            Text(question.description)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
