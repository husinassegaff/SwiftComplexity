import SwiftUI

struct DetailedFeedbackView: View {
    let question: QuizQuestion
    let feedback: FeedbackState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Status header
                    HStack {
                        Image(systemName: feedback.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(feedback.isCorrect ? .green : .red)
                            .font(.title)
                        
                        VStack(alignment: .leading) {
                            Text(feedback.message)
                                .font(.headline)
                            Text("Expected Answer: \(feedback.correctAnswer)")
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Code analysis section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Code Analysis")
                            .font(.title2)
                            .bold()
                        
                        CodeSnippetView(code: question.codeSnippet)
                        
                        ForEach(question.sections, id: \.id) { section in
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Lines \(section.lineNumbers)")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Text(section.code)
                                    .font(.system(.body, design: .monospaced))
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                
                                Text("Complexity: \(section.complexity)")
                                    .bold()
                                
                                Text(section.explanation)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            )
                        }
                    }
                    
                    // Overall explanation
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Overall Analysis")
                            .font(.title2)
                            .bold()
                        
                        Text("Expected Complexity: \(question.expectedComplexity)")
                            .bold()
                        
                        Text(question.explanation)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
            }
            .navigationTitle("Detailed Feedback")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
