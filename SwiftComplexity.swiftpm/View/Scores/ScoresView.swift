import SwiftUI

struct ScoresView: View {
    @StateObject private var viewModel = QuizResultViewModel()
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.allResults.isEmpty {
                EmptyStateView()
            } else {
                HighScoresSection(highScores: viewModel.highScores)
                
                Divider()
                
                HistorySection(
                    selectedDifficulty: $viewModel.selectedDifficulty,
                    results: viewModel.resultsForDifficulty(viewModel.selectedDifficulty)
                )
            }
        }
        .padding()
        .navigationTitle("Quiz Scores")
        .onAppear {
            viewModel.setContext(context: context)
            viewModel.fetchResults()
        }
    }
}
