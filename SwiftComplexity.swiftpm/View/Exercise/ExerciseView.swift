import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Choose Your Challenge Level")
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            
            Text("Select a difficulty level to start practicing time complexity analysis")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer().frame(height: 20)
            
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
            
            Spacer()
        }
        .navigationTitle("Time Complexity Exercise")
        .padding()
    }
}
