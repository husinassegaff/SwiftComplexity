import SwiftUI

struct QuizView: View {
    let difficulty: Difficulty
    @StateObject private var viewModel: QuizViewModel
    @StateObject private var resultViewModel = QuizResultViewModel()
    @EnvironmentObject private var navigationManager: NavigationManager
    @Environment(\.modelContext) private var context
    @State private var showExitAlert = false
    @State private var showQuizResult = false
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        _viewModel = StateObject(wrappedValue: QuizViewModel(difficulty: difficulty))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                 Text(viewModel.formattedTime)
                     .font(.system(.title3, design: .monospaced))
                     .foregroundColor(.secondary)
                 
                 if viewModel.showTimePenalty {
                     Text("+\(Int(viewModel.timePenaltyAmount))s")
                         .font(.system(.title3, design: .monospaced))
                         .foregroundColor(.orange)
                         .transition(.asymmetric(
                             insertion: .scale.combined(with: .opacity),
                             removal: .opacity
                         ))
                 }
             }
             .padding(.vertical, 8)
             .animation(.easeInOut, value: viewModel.showTimePenalty)
            
            ProgressView(value: viewModel.progress)
                .tint(difficultyColor)
                .padding()
            
            if viewModel.isQuizCompleted {
                HStack(spacing: 16) {
                    Button(action: {
                        viewModel.restartQuiz()
                    }) {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text("Try Again")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Button(action: saveAndExit) {
                       HStack {
                           Image(systemName: "square.and.arrow.down")
                           Text("Save & Exit")
                       }
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(Color.green)
                       .foregroundColor(.white)
                       .cornerRadius(10)
                   }
                }
                .padding()
            }
            
            HStack {
                Spacer()
                
                Button {
                    viewModel.toggleHint()
                } label: {
                    Label(viewModel.showHint ? "Close Hint" : "Open Hint",
                          systemImage: viewModel.showHint ? "lightbulb.fill" : "lightbulb")
                        .padding()
                        .background(Color.yellow.opacity(0.2))
                        .foregroundColor(.orange)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            
            ScrollView {
                VStack(spacing: 20) {
                    if viewModel.showHint {
                        HintView(sections: viewModel.currentQuestion.sections)
                            .padding()
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    
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
        }
        .onAppear {
            resultViewModel.setContext(context: context)
        }
    }
    
    private var difficultyColor: Color {
        switch difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }
    
    private func saveAndExit() {
        resultViewModel.saveQuizResult(
            score: viewModel.score,
            totalQuestions: viewModel.questionCount,
            difficulty: difficulty,
            completionTime: viewModel.elapsedTime
        )
        
        navigationManager.navigateBack()
    }
}
