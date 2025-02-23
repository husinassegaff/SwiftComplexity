import SwiftUI

struct TheoryCard: View {
    let material: LearningMaterial
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(material.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(material.content.prefix(100) + "...")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
            
            Text("Read More")
                .font(.caption)
                .bold()
                .foregroundColor(.blue)
        }
        .frame(width: 280, alignment: .leading)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
