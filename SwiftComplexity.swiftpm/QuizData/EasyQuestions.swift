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
    ),
    QuizQuestion(
        title: "String Length Check",
        description: "Check if a string is empty or has a specific length",
        codeSnippet: """
        func checkStringLength(_ text: String, expectedLength: Int) -> Bool {
            guard !text.isEmpty else {
                return false
            }
            return text.count == expectedLength
        }
        """,
        sections: [
            CodeSection(
                code: "guard !text.isEmpty else { return false }",
                complexity: "O(1)",
                explanation: "Checking if a string is empty is constant time in Swift",
                lineNumbers: "2-4"
            ),
            CodeSection(
                code: "return text.count == expectedLength",
                complexity: "O(1)",
                explanation: "String count property access and comparison are constant time operations",
                lineNumbers: "5"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(1)",
        explanation: "This function performs two constant-time operations: checking if the string is empty and comparing its length. In Swift, the count property of a String is cached, making it an O(1) operation. Therefore, the overall time complexity is O(1)."
    ),

    QuizQuestion(
        title: "Array Contains Element",
        description: "Check if an array contains a specific element",
        codeSnippet: """
        func containsElement<T: Equatable>(_ array: [T], element: T) -> Bool {
            for item in array {
                if item == element {
                    return true
                }
            }
            return false
        }
        """,
        sections: [
            CodeSection(
                code: "for item in array { ... }",
                complexity: "O(n)",
                explanation: "Must potentially check every element in the array",
                lineNumbers: "2-6"
            ),
            CodeSection(
                code: "if item == element { return true }",
                complexity: "O(1)",
                explanation: "Comparison of elements is constant time for basic types",
                lineNumbers: "3-5"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function needs to potentially check every element in the array until it finds a match or reaches the end. While it may return early if the element is found, in the worst case (element not present), it must examine all n elements. Therefore, the worst-case time complexity is O(n)."
    ),

    QuizQuestion(
        title: "Array Reverse",
        description: "Reverse the elements of an array in-place",
        codeSnippet: """
        func reverseArray<T>(_ array: inout [T]) {
            var left = 0
            var right = array.count - 1
            
            while left < right {
                array.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        """,
        sections: [
            CodeSection(
                code: "while left < right { ... }",
                complexity: "O(n/2)",
                explanation: "The loop runs for half the array length",
                lineNumbers: "5-9"
            ),
            CodeSection(
                code: "array.swapAt(left, right)",
                complexity: "O(1)",
                explanation: "Swapping elements by index is constant time",
                lineNumbers: "6"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "Although the loop only runs for n/2 iterations (where n is the array length), we drop the constant factor in Big O notation. Each swap operation is O(1), so the overall time complexity is O(n). The space complexity is O(1) as it modifies the array in-place."
    ),

    QuizQuestion(
        title: "Count Character Occurrences",
        description: "Count how many times a specific character appears in a string",
        codeSnippet: """
        func countOccurrences(_ text: String, of char: Character) -> Int {
            var count = 0
            for c in text {
                if c == char {
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
                explanation: "Variable initialization is constant time",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "for c in text { ... }",
                complexity: "O(n)",
                explanation: "Must examine each character in the string once",
                lineNumbers: "3-7"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function must examine each character in the string exactly once to count occurrences. Since each character comparison is O(1) and we need to look at all n characters, where n is the string length, the worst-case time complexity is O(n)."
    ),

    QuizQuestion(
        title: "Array Element Frequency",
        description: "Count the frequency of a specific element in an array",
        codeSnippet: """
        func elementFrequency<T: Hashable>(_ array: [T], element: T) -> Int {
            var frequency = 0
            for item in array {
                if item == element {
                    frequency += 1
                }
            }
            return frequency
        }
        """,
        sections: [
            CodeSection(
                code: "var frequency = 0",
                complexity: "O(1)",
                explanation: "Counter initialization is constant time",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "for item in array { ... }",
                complexity: "O(n)",
                explanation: "Must check every element in the array",
                lineNumbers: "3-7"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function must examine every element in the array to count all occurrences of the target element. Even if the element appears multiple times, we still need to check all elements to ensure we haven't missed any occurrences. Since each comparison is O(1) and we check all n elements, the worst-case time complexity is O(n)."
    ),
    QuizQuestion(
        title: "Array Concatenation",
        description: "Combine two arrays into a single array",
        codeSnippet: """
        func combineArrays<T>(_ array1: [T], _ array2: [T]) -> [T] {
            var result: [T] = []
            for element in array1 {
                result.append(element)
            }
            for element in array2 {
                result.append(element)
            }
            return result
        }
        """,
        sections: [
            CodeSection(
                code: "for element in array1 { result.append(element) }",
                complexity: "O(n)",
                explanation: "Must process each element from both arrays",
                lineNumbers: "3-5"
            ),
            CodeSection(
                code: "for element in array2 { result.append(element) }",
                complexity: "O(n)",
                explanation: "Second loop also processes n elements in worst case",
                lineNumbers: "6-8"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function processes each element once from both arrays. While this could be written as O(n + m), in Big O notation we simplify to O(n) where n represents the total input size."
    ),

    QuizQuestion(
        title: "Array Contains Duplicates",
        description: "Check if an array contains any duplicate elements",
        codeSnippet: """
        func hasDuplicates<T: Hashable>(_ array: [T]) -> Bool {
            var seen: Set<T> = []
            for element in array {
                if seen.contains(element) {
                    return true
                }
                seen.insert(element)
            }
            return false
        }
        """,
        sections: [
            CodeSection(
                code: "var seen: Set<T> = []",
                complexity: "O(1)",
                explanation: "Set initialization is constant time",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "for element in array { ... }",
                complexity: "O(n)",
                explanation: "Iterates through each element once",
                lineNumbers: "3-7"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "While the function might return early if it finds a duplicate, in the worst case (no duplicates), it needs to examine all elements once. Set operations are O(1), making the overall complexity O(n)."
    ),

    QuizQuestion(
        title: "Count Positive Numbers",
        description: "Count how many positive numbers are in an array",
        codeSnippet: """
        func countPositiveNumbers(_ numbers: [Int]) -> Int {
            var count = 0
            for number in numbers {
                if number > 0 {
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
                code: "for number in numbers { ... }",
                complexity: "O(n)",
                explanation: "Must check every number in the array",
                lineNumbers: "3-7"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "The function must examine each number in the array once to determine if it's positive. Each comparison is O(1) and we check all n elements, making the time complexity O(n)."
    ),

    QuizQuestion(
        title: "String Prefix Check",
        description: "Check if a string starts with a given prefix",
        codeSnippet: """
        func hasPrefix(_ text: String, prefix: String) -> Bool {
            guard prefix.count <= text.count else {
                return false
            }
            let prefixIndex = text.index(text.startIndex, 
                                       offsetBy: prefix.count)
            let textPrefix = text[..<prefixIndex]
            return String(textPrefix) == prefix
        }
        """,
        sections: [
            CodeSection(
                code: "guard prefix.count <= text.count else { ... }",
                complexity: "O(1)",
                explanation: "Length comparison is constant time",
                lineNumbers: "2-4"
            ),
            CodeSection(
                code: "let textPrefix = text[..<prefixIndex]",
                complexity: "O(n)",
                explanation: "String slicing and comparison in worst case",
                lineNumbers: "6"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(n)",
        explanation: "In the worst case, where the prefix could be as long as the text itself, we need to examine n characters. Therefore, the overall time complexity is O(n)."
    ),

    QuizQuestion(
        title: "Array Last Element",
        description: "Safely get the last element of an array if it exists",
        codeSnippet: """
        func getLastElement<T>(_ array: [T]) -> T? {
            guard !array.isEmpty else {
                return nil
            }
            return array[array.count - 1]
        }
        """,
        sections: [
            CodeSection(
                code: "guard !array.isEmpty else { ... }",
                complexity: "O(1)",
                explanation: "Checking if array is empty is constant time",
                lineNumbers: "2-4"
            ),
            CodeSection(
                code: "return array[array.count - 1]",
                complexity: "O(1)",
                explanation: "Accessing last element by index is constant time",
                lineNumbers: "5"
            )
        ],
        difficulty: .easy,
        expectedComplexity: "O(1)",
        explanation: "This function only performs constant-time operations: checking if the array is empty and accessing the last element by index. Both operations are O(1) in Swift arrays."
    )
]
