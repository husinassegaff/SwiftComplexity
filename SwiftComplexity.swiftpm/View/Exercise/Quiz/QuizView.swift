import SwiftUI

struct QuizView: View {
    let difficulty: Difficulty
    @StateObject private var viewModel: QuizViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        _viewModel = StateObject(wrappedValue: QuizViewModel(difficulty: difficulty))
    }
    
    var body: some View {
        VStack(spacing: 0) {
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Exit") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Question \(viewModel.currentQuestionIndex + 1)/\(viewModel.questionCount)")
                    .foregroundColor(.secondary)
            }
        }
        .sheet(isPresented: $viewModel.showResult) {
            QuizResultView(viewModel: viewModel)
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
