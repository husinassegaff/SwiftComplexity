import SwiftUI

struct HistoryRow: View {
    let result: QuizResult
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(Int(result.scorePercentage))%")
                    .bold()
                Text(result.formattedTime)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(result.dateCompleted.formatted(date: .abbreviated, time: .shortened))
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
