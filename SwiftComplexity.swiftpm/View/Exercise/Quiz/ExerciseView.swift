import SwiftUI

struct ExerciseView: View {
    @State private var selectedDifficulty: Difficulty?
    
    var body: some View {
        NavigationStack {
            if let difficulty = selectedDifficulty {
                QuizView(difficulty: difficulty)
            } else {
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
                        selectedDifficulty = .easy
                    } label: {
                        DifficultyButton(
                            title: "Easy",
                            color: .green)
                    }
                    
                    Button {
                        selectedDifficulty = .medium
                    } label: {
                        DifficultyButton(
                            title: "Medium",
                            color: .orange)
                    }
                    
                    Button {
                        selectedDifficulty = .hard
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
    }
}
