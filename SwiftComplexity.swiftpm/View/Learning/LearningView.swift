import SwiftUI

struct LearningView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    Text("Time Complexity Learning")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                    
                    Text("Learn about time complexity through theory and practical examples")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Theoretical Concepts")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(TimeComplexityTheory) { material in
                                Button {
                                    navigationManager.navigateTo(.theory(material: material))
                                } label: {
                                    TheoryCard(material: material)
                                }
                            }
                        }
                        .padding()
                    }
                }

                VStack(alignment: .leading, spacing: 24) {
                    Text("Code Examples")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 300, maximum: 400), spacing: 16)
                    ], spacing: 16) {
                        ForEach(ComplexityExamples) { example in
                            Button {
                                navigationManager.navigateTo(.codeExample(example: example))
                            } label: {
                                ExampleCard(example: example)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 32)
        }
        .navigationTitle("Learn")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                MusicControlButton()
            }
        }
    }
}
