import SwiftUI

struct ComplexityChoicesView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    private let complexityOptions = [
        "O(1)", "O(log n)", "O(n)",
        "O(n log n)", "O(n²)", "O(2ⁿ)"
    ]
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(complexityOptions, id: \.self) { complexity in
                Button {
                    viewModel.selectedComplexity = complexity
                    if let currentSection = viewModel.currentQuestion.sections.first {
                        viewModel.checkAnswer(for: currentSection.id, answer: complexity)
                    }
                } label: {
                    Text(complexity)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(buttonBackground(for: complexity))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(viewModel.feedback != nil)
            }
            
            if let feedback = viewModel.feedback {
                FeedbackView(feedback: feedback, question: viewModel.currentQuestion)
                
                if !viewModel.isLastQuestion {
                    Button {
                        viewModel.moveToNextQuestion()
                    } label: {
                        Text("Next Question")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.top)
                }
            }
        }
        .padding()
    }
    
    private func buttonBackground(for complexity: String) -> Color {
        if let feedback = viewModel.feedback {
            if viewModel.selectedComplexity == complexity {
                return feedback.isCorrect ? .green : .red
            }
            if complexity == feedback.correctAnswer {
                return .green
            }
        }
        return viewModel.selectedComplexity == complexity ? .blue : .gray
    }
}
