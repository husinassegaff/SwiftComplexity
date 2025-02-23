import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack(spacing: 16) {
                    Text("Challenge Your Time Complexity Skills")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                    
                    Text("Test your algorithm analysis abilities with our interactive quizzes")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                HStack(spacing: 0) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Quiz Features")
                            .font(.title2)
                            .bold()
                        
                        FeatureRow(
                            icon: "list.number",
                            title: "5 Challenging Questions",
                            description: "Each quiz contains 5 carefully selected algorithm problems"
                        )
                        
                        FeatureRow(
                            icon: "clock",
                            title: "Timed Challenge",
                            description: "Track your solving speed with an integrated timer"
                        )
                        
                        FeatureRow(
                            icon: "lightbulb",
                            title: "Smart Hints Available",
                            description: "Get line-by-line complexity hints with a small time penalty"
                        )
                        
                        FeatureRow(
                            icon: "chart.bar.doc.horizontal",
                            title: "Detailed Analysis",
                            description: "Review comprehensive explanations after each answer"
                        )
                        
                        FeatureRow(
                            icon: "pencil.and.ruler",
                            title: "Drawing Canvas",
                            description: "Visualize and solve complexity problems with a built-in canvas"
                        )
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    Spacer()
                    VStack(spacing: 20) {
                        Text("Select Your Level")
                            .font(.title2)
                            .bold()
                        
                        Button {
                            navigationManager.navigateTo(.quiz(difficulty: .easy))
                        } label: {
                            DifficultyButton(
                                title: "Easy",
                                color: .green)
                        }
                        
                        Button {
                            navigationManager.navigateTo(.quiz(difficulty: .medium))
                        } label: {
                            DifficultyButton(
                                title: "Medium",
                                color: .orange)
                        }
                        
                        Button {
                            navigationManager.navigateTo(.quiz(difficulty: .hard))
                        } label: {
                            DifficultyButton(
                                title: "Hard",
                                color: .red)
                        }
                    }
                    Spacer()
                }
            }
            .padding()
        }
        .navigationTitle("Exercise")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                MusicControlButton()
            }
        }
    }
}
