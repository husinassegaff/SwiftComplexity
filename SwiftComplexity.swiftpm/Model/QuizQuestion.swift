import SwiftUI

struct QuizQuestion {
    let id: UUID = UUID()
    let title: String
    let description: String
    let codeSnippet: String
    let sections: [CodeSection]
    let difficulty: Difficulty
    let expectedComplexity: String
    let explanation: String
}
