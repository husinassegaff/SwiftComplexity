import SwiftUI

struct CodeSnippetView: View {
    let code: String
    
    private func splitIntoLines() -> [(number: Int, code: String)] {
        let lines = code.components(separatedBy: .newlines)
        return lines.enumerated().map { (index, line) in
            (number: index + 1, code: line)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(splitIntoLines(), id: \.number) { line in
                    HStack(spacing: 0) {
                        Text("\(line.number)")
                            .font(.system(.caption, design: .monospaced))
                            .foregroundColor(.secondary)
                            .frame(width: 40, alignment: .trailing)
                            .padding(.horizontal, 8)
                        
                        Rectangle()
                            .fill(Color(.systemGray4))
                            .frame(width: 1)
                        

                        Text(line.code)
                            .font(.system(.body, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 12)
                        
                        Spacer()
                    }
                    .padding(.vertical, 2)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .padding()
    }
}
