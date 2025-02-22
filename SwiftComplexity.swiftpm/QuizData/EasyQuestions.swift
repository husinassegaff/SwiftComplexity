let easyQuestions = [
    QuizQuestion(
        title: "Simple Array Search",
        description: "Find a specific element in an array using linear search",
        codeSnippet: """
        func findElement(_ array: [Int], target: Int) -> Int? {
            for (index, element) in array.enumerated() {
                if element == target {
                    return index
                }
            }
            return nil
        }
        """,
        sections: [
            CodeSection(
                code: "for (index, element) in array.enumerated()",
                complexity: "O(n)",
                explanation: "The loop iterates through each element once, where n is the array size",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "if element == target { return index }",
                complexity: "O(1)",
                explanation: "Comparison and return operations are constant time",
                lineNumbers: "3-4"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "In the worst-case scenario, the target element is not in the array, requiring the loop to iterate over all n elements. Since each iteration takes constant time O(1), the overall worst-case time complexity is O(n)."
    ),
    
    QuizQuestion(
        title: "Array Maximum",
        description: "Find the maximum value in an array",
        codeSnippet: """
        func findMax(_ array: [Int]) -> Int? {
            guard !array.isEmpty else { return nil }
            var maxValue = array[0]
            
            for value in array {
                if value > maxValue {
                    maxValue = value
                }
            }
            return maxValue
        }
        """,
        sections: [
            CodeSection(
                code: "var maxValue = array[0]",
                complexity: "O(1)",
                explanation: "Initial assignment is constant time",
                lineNumbers: "3"
            ),
            CodeSection(
                code: "for value in array { ... }",
                complexity: "O(n)",
                explanation: "Single pass through the array, where n is the array size",
                lineNumbers: "5-8"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function iterates through all n elements in the array to find the maximum value. Since each comparison takes constant time O(1), the worst-case time complexity is O(n)."
    ),
    
    QuizQuestion(
        title: "Array Sum",
        description: "Calculate the sum of all elements in an array",
        codeSnippet: """
        func calculateSum(_ array: [Int]) -> Int {
            var sum = 0
            for number in array {
                sum += number
            }
            return sum
        }
        """,
        sections: [
            CodeSection(
                code: "var sum = 0",
                complexity: "O(1)",
                explanation: "Variable initialization is constant time",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "for number in array { sum += number }",
                complexity: "O(n)",
                explanation: "Single iteration through all elements",
                lineNumbers: "3-5"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function loops through all elements of the array exactly once, performing constant-time O(1) operations for each element. This results in a worst-case time complexity of O(n)."
    ),
    
    QuizQuestion(
        title: "Check Even Numbers",
        description: "Count how many even numbers are in an array",
        codeSnippet: """
        func countEvenNumbers(_ array: [Int]) -> Int {
            var count = 0
            for number in array {
                if number % 2 == 0 {
                    count += 1
                }
            }
            return count
        }
        """,
        sections: [
            CodeSection(
                code: "var count = 0",
                complexity: "O(1)",
                explanation: "Counter initialization is constant time",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "for number in array { ... }",
                complexity: "O(n)",
                explanation: "Linear traversal through the array",
                lineNumbers: "3-7"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function iterates through all elements of the array, checking each number once. Since each iteration takes O(1) time, the worst-case complexity remains O(n)."

    ),
    
    QuizQuestion(
        title: "First and Last Element",
        description: "Return the first and last elements of an array if they exist",
        codeSnippet: """
        func getFirstAndLast(_ array: [Int]) -> (first: Int?, last: Int?) {
            guard !array.isEmpty else {
                return (nil, nil)
            }
            let first = array[0]
            let last = array[array.count - 1]
            return (first, last)
        }
        """,
        sections: [
            CodeSection(
                code: "guard !array.isEmpty else { return (nil, nil) }",
                complexity: "O(1)",
                explanation: "Checking if array is empty is constant time",
                lineNumbers: "2-4"
            ),
            CodeSection(
                code: "let first = array[0]\nlet last = array[array.count - 1]",
                complexity: "O(1)",
                explanation: "Accessing array elements by index is constant time",
                lineNumbers: "5-6"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(1)",
        explanation:"Accessing the first and last elements of an array using indexing is a constant-time operation O(1). The function does not iterate through the array, so the worst-case time complexity is O(1)."
    )
]
