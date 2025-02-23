import SwiftUI

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color(.systemBackground) : Color.clear)
                .foregroundColor(isSelected ? .primary : .secondary)
        }
    }
}
