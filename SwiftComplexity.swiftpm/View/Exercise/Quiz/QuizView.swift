import SwiftUI

struct QuizView: View {
    let difficulty: Difficulty
    @StateObject private var viewModel: QuizViewModel
    @EnvironmentObject private var navigationManager: NavigationManager
    @State private var showExitAlert = false
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        _viewModel = StateObject(wrappedValue: QuizViewModel(difficulty: difficulty))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(viewModel.formattedTime)
                .font(.system(.title3, design: .monospaced))
                .foregroundColor(.secondary)
                .padding(.vertical, 8)
            
            ProgressView(value: viewModel.progress)
                .tint(difficultyColor)
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    QuestionHeaderView(question: viewModel.currentQuestion)
                    
                    HStack(spacing: 20) {
                        VStack {
                            CodeSnippetView(code: viewModel.currentQuestion.codeSnippet)
                            ComplexityChoicesView(viewModel: viewModel)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        
                        DrawingCanvasView()
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("\(difficulty.rawValue) Level")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Exit") {
                    showExitAlert = true
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 12) {
                    Text("Score: \(viewModel.score)")
                        .foregroundColor(.secondary)
                    Text("•")
                        .foregroundColor(.secondary)
                    Text("Question \(viewModel.currentQuestionIndex + 1)/\(viewModel.questionCount)")
                        .foregroundColor(.secondary)
                }
            }
        }
        .alert("Exit Quiz", isPresented: $showExitAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Exit", role: .destructive) {
                navigationManager.navigateBack()
            }
        } message: {
            Text("Your progress will not be saved. Are you sure you want to exit?")
        }
        .sheet(isPresented: $viewModel.showResult) {
            QuizResultView(viewModel: viewModel)
                .onDisappear {
                    navigationManager.popToRoot()
                }
        }
    }
    
    private var difficultyColor: Color {
        switch difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }
}
