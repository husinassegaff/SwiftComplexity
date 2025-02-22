import SwiftUI

struct DifficultyButton: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .frame(width: 200, height: 60)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
