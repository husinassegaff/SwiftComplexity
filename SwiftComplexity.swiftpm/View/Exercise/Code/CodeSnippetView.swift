import SwiftUI

struct CodeSnippetView: View {
    let code: String
    
    var body: some View {
        ScrollView {
            Text(code)
                .font(.system(.body, design: .monospaced))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .padding()
    }
}
