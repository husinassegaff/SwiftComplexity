import SwiftUI

struct HistorySection: View {
    @Binding var selectedDifficulty: Difficulty
    let results: [QuizResult]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("History")
                .font(.title2)
                .bold()
            
            Picker("Difficulty", selection: $selectedDifficulty) {
                ForEach(Difficulty.allCases, id: \.self) { difficulty in
                    Text(difficulty.rawValue)
                        .tag(difficulty)
                }
            }
            .pickerStyle(.segmented)
            
            if results.isEmpty {
                Text("No attempts for this difficulty level")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(results) { result in
                            HistoryRow(result: result)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}
