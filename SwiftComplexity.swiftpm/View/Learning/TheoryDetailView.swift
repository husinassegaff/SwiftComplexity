import SwiftUI

struct TheoryDetailView: View {
    let material: LearningMaterial
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(material.title)
                        .font(.system(size: 28, weight: .bold))
                    
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 4)
                        .cornerRadius(2)
                }
                
                ForEach(material.content.components(separatedBy: "\n\n"), id: \.self) { section in
                    if section.hasPrefix("•") {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(section.components(separatedBy: "\n"), id: \.self) { point in
                                if !point.isEmpty {
                                    HStack(alignment: .top, spacing: 12) {
                                        Text("•")
                                            .foregroundColor(.blue)
                                        Text(point.trimmingPrefix("•"))
                                    }
                                }
                            }
                        }
                    } else {
                        Text(section)
                            .padding(.vertical, 4)
                    }
                }
            }
            .padding()
            .frame(maxWidth: 800)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
