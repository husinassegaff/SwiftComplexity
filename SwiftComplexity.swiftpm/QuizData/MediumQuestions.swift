
let mediumQuestions = [
    QuizQuestion(
        title: "Binary Search Implementation",
        description: "Find an element in a sorted array using binary search",
        codeSnippet: """
        func binarySearch(_ array: [Int], target: Int) -> Int? {
            var left = 0
            var right = array.count - 1
            
            while left <= right {
                let mid = (left + right) / 2
                if array[mid] == target {
                    return mid
                } else if array[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            return nil
        }
        """,
        sections: [
            CodeSection(
                code: "var left = 0\nvar right = array.count - 1",
                complexity: "O(1)",
                explanation: "Initial pointer setup is constant time",
                lineNumbers: "2-3"
            ),
            CodeSection(
                code: "while left <= right { ... }",
                complexity: "O(log n)",
                explanation: "Binary search divides the search space in half each iteration",
                lineNumbers: "5-14"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(log n)",
        explanation: "Binary search repeatedly divides the search space in half. In the worst case, the search continues until only one element remains, which takes at most log₂(n) iterations. Since each iteration involves constant-time operations (comparison and index updates), the worst-case time complexity is O(log n)."
    ),
    
    QuizQuestion(
        title: "Merge Sorted Arrays",
        description: "Merge two sorted arrays into a single sorted array",
        codeSnippet: """
        func mergeSortedArrays(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
            var result: [Int] = []
            var i = 0, j = 0
            
            while i < arr1.count && j < arr2.count {
                if arr1[i] <= arr2[j] {
                    result.append(arr1[i])
                    i += 1
                } else {
                    result.append(arr2[j])
                    j += 1
                }
            }
            
            while i < arr1.count {
                result.append(arr1[i])
                i += 1
            }
            
            while j < arr2.count {
                result.append(arr2[j])
                j += 1
            }
            
            return result
        }
        """,
        sections: [
            CodeSection(
                code: "while i < arr1.count && j < arr2.count { ... }",
                complexity: "O(n)",
                explanation: "The merge loop processes each element in arr1 and arr2 exactly once, making the worst-case complexity O(n).",
                lineNumbers: "5-13"
            ),
            CodeSection(
                code: "while i < arr1.count { ... }\nwhile j < arr2.count { ... }",
                complexity: "O(n)",
                explanation: "Since one of the loops runs for the remaining elements, the worst-case complexity remains O(n).",
                lineNumbers: "15-23"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n)",
        explanation: "The function merges two sorted arrays by iterating through both sequentially. In the worst case, every element must be processed once. If we assume n is the dominant term, the worst-case time complexity simplifies to O(n)."
    ),
    
    QuizQuestion(
        title: "Find Duplicates",
        description: "Find all duplicate numbers in an array using a dictionary",
        codeSnippet: """
        func findDuplicates(_ array: [Int]) -> [Int] {
            var counts: [Int: Int] = [:]
            var duplicates: [Int] = []
            
            for num in array {
                counts[num, default: 0] += 1
                if counts[num] == 2 {
                    duplicates.append(num)
                }
            }
            
            return duplicates
        }
        """,
        sections: [
            CodeSection(
                code: "for num in array { ... }",
                complexity: "O(n)",
                explanation: "Single pass through the array",
                lineNumbers: "5-9"
            ),
            CodeSection(
                code: "counts[num, default: 0] += 1",
                complexity: "O(1)",
                explanation: "Dictionary operations are constant time on average",
                lineNumbers: "6"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n)",
        explanation: "The function iterates over the array once, storing occurrences of elements in a dictionary. Since dictionary insertions and lookups are on average O(1), the entire loop runs in O(n) time, making the overall worst-case complexity O(n)."
    ),
    
    QuizQuestion(
        title: "Matrix Diagonal Sum",
        description: "Calculate the sum of both diagonals in a square matrix",
        codeSnippet: """
        func diagonalSum(_ matrix: [[Int]]) -> Int {
            let n = matrix.count
            var sum = 0
            
            for i in 0..<n {
                // Main diagonal
                sum += matrix[i][i]
                // Secondary diagonal
                if i != n - 1 - i {
                    sum += matrix[i][n - 1 - i]
                }
            }
            
            return sum
        }
        """,
        sections: [
            CodeSection(
                code: "for i in 0..<n { ... }",
                complexity: "O(n)",
                explanation: "Single pass through matrix diagonal elements",
                lineNumbers: "5-11"
            ),
            CodeSection(
                code: "sum += matrix[i][i]",
                complexity: "O(1)",
                explanation: "Array access and addition are constant time",
                lineNumbers: "7"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n)",
        explanation: "The function iterates over the diagonal elements of an n x n matrix. Since it only traverses n elements (one from each row), the worst-case time complexity is O(n)."
    ),
    
    QuizQuestion(
        title: "Rotate Array",
        description: "Rotate an array to the right by k steps",
        codeSnippet: """
        func rotateArray(_ nums: inout [Int], by k: Int) {
            let n = nums.count
            let rotations = k % n
            
            func reverse(_ start: Int, _ end: Int) {
                var left = start
                var right = end
                while left < right {
                    nums.swapAt(left, right)
                    left += 1
                    right -= 1
                }
            }
            
            reverse(0, n - 1)
            reverse(0, rotations - 1)
            reverse(rotations, n - 1)
        }
        """,
        sections: [
            CodeSection(
                code: "func reverse(_ start: Int, _ end: Int) { ... }",
                complexity: "O(n)",
                explanation: "Reversal function takes linear time",
                lineNumbers: "4-12"
            ),
            CodeSection(
                code: "reverse(0, n - 1)\nreverse(0, rotations - 1)\nreverse(rotations, n - 1)",
                complexity: "O(n)",
                explanation: "Three reversals, each taking O(n/3) time",
                lineNumbers: "14-16"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n)",
        explanation: "The function performs three array reversals, each running in O(n) time. Since constant factors are ignored in asymptotic analysis, the overall worst-case time complexity remains O(n)."
    )
]
