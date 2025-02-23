import SwiftUI

struct CodeExampleDetailView: View {
    let example: CodeExample
    @State private var selectedTab = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(example.title)
                        .font(.system(size: 28, weight: .bold))
                    
                    HStack(spacing: 12) {
                        Label("Time Complexity", systemImage: "clock")
                        Text(example.complexity)
                            .padding(8)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                    .font(.headline)
                }
                .padding(.bottom)
                
                VStack(spacing: 0) {

                    HStack(spacing: 0) {
                        TabButton(title: "Implementation", isSelected: selectedTab == 0) {
                            withAnimation { selectedTab = 0 }
                        }
                        
                        TabButton(title: "Explanation", isSelected: selectedTab == 1) {
                            withAnimation { selectedTab = 1 }
                        }
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    if selectedTab == 0 {
                        VStack(alignment: .leading, spacing: 16) {
                            CodeSnippetView(code: example.code)
                                .transition(.opacity)
                        }
                    } else {
                        VStack(alignment: .leading, spacing: 16) {
                
                            Text(example.explanation)
                                .padding(.bottom)
                                .padding(.horizontal)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .transition(.opacity)
                        }
                    }
                }
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(radius: 2)
            }
            .padding()
            .frame(maxWidth: 800)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
}
