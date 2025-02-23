import SwiftUI

struct ExampleCard: View {
    let example: CodeExample
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(example.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(example.complexity)
                    .font(.subheadline)
                    .padding(6)
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .cornerRadius(6)
            }
            
            Text(example.explanation)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text("View Example")
                .font(.caption)
                .bold()
                .foregroundColor(.blue)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}


