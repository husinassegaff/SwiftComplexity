import SwiftUI

struct HintView: View {
    let sections: [CodeSection]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Hints")
                .font(.title2)
                .bold()
                .padding(.bottom, 8)
            
            ForEach(sections, id: \.id) { section in
                VStack(alignment: .leading, spacing: 8) {
                    Text("Lines \(section.lineNumbers)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(section.code)
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Text(section.explanation)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}
