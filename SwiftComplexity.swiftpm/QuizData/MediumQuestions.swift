
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
    ),
    QuizQuestion(
        title: "Two Sum Problem",
        description: "Find two numbers in an array that add up to a target value",
        codeSnippet: """
        func findTwoSum(_ numbers: [Int], target: Int) -> (Int, Int)? {
            for i in 0..<numbers.count {
                for j in (i + 1)..<numbers.count {
                    if numbers[i] + numbers[j] == target {
                        return (i, j)
                    }
                }
            }
            return nil
        }
        """,
        sections: [
            CodeSection(
                code: "for i in 0..<numbers.count { ... }",
                complexity: "O(n)",
                explanation: "Outer loop iterates through each element",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "for j in (i + 1)..<numbers.count { ... }",
                complexity: "O(n)",
                explanation: "Inner loop creates nested iteration",
                lineNumbers: "3-7"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n²)",
        explanation: "The function uses nested loops where for each element (n), we potentially check all remaining elements (n-1). This creates a quadratic time complexity of O(n²) in the worst case when no solution exists or the solution is at the end."
    ),

    QuizQuestion(
        title: "Matrix Element Search",
        description: "Search for an element in a sorted matrix where each row and column is sorted",
        codeSnippet: """
        func findInSortedMatrix(_ matrix: [[Int]], target: Int) -> (Int, Int)? {
            guard !matrix.isEmpty else { return nil }
            let m = matrix.count
            let n = matrix[0].count
            var row = 0
            var col = n - 1
            
            while row < m && col >= 0 {
                if matrix[row][col] == target {
                    return (row, col)
                } else if matrix[row][col] > target {
                    col -= 1
                } else {
                    row += 1
                }
            }
            return nil
        }
        """,
        sections: [
            CodeSection(
                code: "guard !matrix.isEmpty else { return nil }",
                complexity: "O(1)",
                explanation: "Initial check is constant time",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "while row < m && col >= 0 { ... }",
                complexity: "O(n)",
                explanation: "Single pass through matrix starting from top-right",
                lineNumbers: "8-15"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n)",
        explanation: "The algorithm starts from the top-right corner and eliminates either a row or column in each iteration. In the worst case, we might need to traverse to the bottom-left corner, making at most m + n moves. Since m and n are dimensions of the matrix, this simplifies to O(n)."
    ),

    QuizQuestion(
        title: "Insertion Sort Implementation",
        description: "Sort an array using insertion sort algorithm",
        codeSnippet: """
        func insertionSort(_ array: inout [Int]) {
            for i in 1..<array.count {
                let key = array[i]
                var j = i - 1
                
                while j >= 0 && array[j] > key {
                    array[j + 1] = array[j]
                    j -= 1
                }
                array[j + 1] = key
            }
        }
        """,
        sections: [
            CodeSection(
                code: "for i in 1..<array.count { ... }",
                complexity: "O(n)",
                explanation: "Outer loop processes each element",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "while j >= 0 && array[j] > key { ... }",
                complexity: "O(n)",
                explanation: "Inner loop may process all previous elements",
                lineNumbers: "6-9"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n²)",
        explanation: "Insertion sort compares each element with all previous elements to find its correct position. In the worst case (reverse sorted array), for each element (n), we need to compare and shift all previous elements, resulting in O(n²) time complexity."
    ),

    QuizQuestion(
        title: "Peak Element Finder",
        description: "Find a peak element in an array where neighbors are different",
        codeSnippet: """
        func findPeakElement(_ nums: [Int]) -> Int {
            var left = 0
            var right = nums.count - 1
            
            while left < right {
                let mid = (left + right) / 2
                if nums[mid] > nums[mid + 1] {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }
        """,
        sections: [
            CodeSection(
                code: "var left = 0\nvar right = nums.count - 1",
                complexity: "O(1)",
                explanation: "Initial setup is constant time",
                lineNumbers: "2-3"
            ),
            CodeSection(
                code: "while left < right { ... }",
                complexity: "O(log n)",
                explanation: "Binary search approach halves search space each time",
                lineNumbers: "5-11"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(log n)",
        explanation: "This algorithm uses a binary search approach to find a peak element. In each iteration, it eliminates half of the remaining elements by comparing the middle element with its neighbor. Since the search space is halved in each step, the time complexity is O(log n)."
    ),

    QuizQuestion(
        title: "String Pattern Match",
        description: "Find all occurrences of a pattern in a string",
        codeSnippet: """
        func findPattern(_ text: String, _ pattern: String) -> [Int] {
            let text = Array(text)
            let pattern = Array(pattern)
            var result: [Int] = []
            
            for i in 0...(text.count - pattern.count) {
                var matches = true
                for j in 0..<pattern.count {
                    if text[i + j] != pattern[j] {
                        matches = false
                        break
                    }
                }
                if matches {
                    result.append(i)
                }
            }
            return result
        }
        """,
        sections: [
            CodeSection(
                code: "for i in 0...(text.count - pattern.count) { ... }",
                complexity: "O(n)",
                explanation: "Outer loop iterates through text",
                lineNumbers: "5"
            ),
            CodeSection(
                code: "for j in 0..<pattern.count { ... }",
                complexity: "O(n)",
                explanation: "Inner loop creates nested iteration",
                lineNumbers: "7-12"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n²)",
        explanation: "The algorithm uses a brute force approach to check each possible position in the text for the pattern. For each position (n), we might need to compare up to n characters, leading to a worst-case time complexity of O(n²)."
    ),
    QuizQuestion(
        title: "Bubble Sort Implementation",
        description: "Sort an array using bubble sort algorithm",
        codeSnippet: """
        func bubbleSort(_ array: inout [Int]) {
            let n = array.count
            for i in 0..<n {
                var swapped = false
                for j in 0..<(n - i - 1) {
                    if array[j] > array[j + 1] {
                        array.swapAt(j, j + 1)
                        swapped = true
                    }
                }
                if !swapped {
                    break
                }
            }
        }
        """,
        sections: [
            CodeSection(
                code: "for i in 0..<n { ... }",
                complexity: "O(n)",
                explanation: "Outer loop iterates through the array",
                lineNumbers: "3"
            ),
            CodeSection(
                code: "for j in 0..<(n - i - 1) { ... }",
                complexity: "O(n)",
                explanation: "Inner loop creates nested iteration",
                lineNumbers: "5-10"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n²)",
        explanation: "Bubble sort compares adjacent elements and swaps them if they're in the wrong order. The algorithm requires two nested loops: the outer loop (n iterations) and the inner loop (up to n iterations), resulting in O(n²) time complexity in the worst case."
    ),

    QuizQuestion(
        title: "Power Function",
        description: "Implement an efficient power function using divide and conquer",
        codeSnippet: """
        func power(_ base: Int, _ exponent: Int) -> Int {
            guard exponent > 0 else { return 1 }
            
            if exponent % 2 == 0 {
                let half = power(base, exponent / 2)
                return half * half
            } else {
                let half = power(base, (exponent - 1) / 2)
                return base * half * half
            }
        }
        """,
        sections: [
            CodeSection(
                code: "guard exponent > 0 else { return 1 }",
                complexity: "O(1)",
                explanation: "Base case check is constant time",
                lineNumbers: "2"
            ),
            CodeSection(
                code: "let half = power(base, exponent / 2)",
                complexity: "O(log n)",
                explanation: "Recursive calls reduce exponent by half each time",
                lineNumbers: "5,8"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(log n)",
        explanation: "This efficient power implementation uses divide and conquer strategy. Instead of multiplying the base n times, it recursively calculates power(base, n/2) and squares the result. Since the exponent is halved in each recursive call, the time complexity is O(log n)."
    ),

    QuizQuestion(
        title: "Majority Element",
        description: "Find the element that appears more than n/2 times in an array",
        codeSnippet: """
        func findMajorityElement(_ array: [Int]) -> Int? {
            var candidate = array[0]
            var count = 1
            
            for i in 1..<array.count {
                if count == 0 {
                    candidate = array[i]
                    count = 1
                } else if array[i] == candidate {
                    count += 1
                } else {
                    count -= 1
                }
            }
            
            // Verify candidate is majority
            count = 0
            for num in array {
                if num == candidate {
                    count += 1
                }
            }
            
            return count > array.count / 2 ? candidate : nil
        }
        """,
        sections: [
            CodeSection(
                code: "for i in 1..<array.count { ... }",
                complexity: "O(n)",
                explanation: "First pass through array to find candidate",
                lineNumbers: "4-13"
            ),
            CodeSection(
                code: "for num in array { ... }",
                complexity: "O(n)",
                explanation: "Second pass to verify majority element",
                lineNumbers: "16-20"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n)",
        explanation: "This algorithm uses Boyer-Moore Voting Algorithm. It makes two passes through the array: first to find a candidate (O(n)) and second to verify if it's the majority element (O(n)). Since we perform two sequential O(n) operations, the final time complexity is O(n)."
    ),

    QuizQuestion(
        title: "Binary String Subset",
        description: "Generate all possible subsets of a binary string",
        codeSnippet: """
        func generateBinarySubsets(_ str: String) -> [String] {
            let chars = Array(str)
            var result: [String] = []
            
            func backtrack(_ current: String, _ index: Int) {
                if index == chars.count {
                    result.append(current)
                    return
                }
                
                backtrack(current, index + 1)
                backtrack(current + String(chars[index]), index + 1)
            }
            
            backtrack("", 0)
            return result
        }
        """,
        sections: [
            CodeSection(
                code: "func backtrack(_ current: String, _ index: Int)",
                complexity: "O(2ⁿ)",
                explanation: "Each character doubles the number of possibilities",
                lineNumbers: "4-11"
            ),
            CodeSection(
                code: "backtrack(current, index + 1)\nbacktrack(current + String(chars[index]), index + 1)",
                complexity: "O(2ⁿ)",
                explanation: "Two recursive calls for each character",
                lineNumbers: "13-14"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(2ⁿ)",
        explanation: "For each character in the string, we have two choices: include it or not. This creates a binary tree of possibilities with 2ⁿ leaves, where n is the string length. Therefore, the time complexity is O(2ⁿ) as we need to generate all possible combinations."
    ),

    QuizQuestion(
        title: "Sorted Array Merger",
        description: "Merge k sorted arrays of equal length into one sorted array",
        codeSnippet: """
        func mergeSortedArrays(_ arrays: [[Int]]) -> [Int] {
            guard !arrays.isEmpty else { return [] }
            var result = arrays[0]
            
            for i in 1..<arrays.count {
                let current = arrays[i]
                var merged: [Int] = []
                var left = 0, right = 0
                
                while left < result.count && right < current.count {
                    if result[left] <= current[right] {
                        merged.append(result[left])
                        left += 1
                    } else {
                        merged.append(current[right])
                        right += 1
                    }
                }
                
                merged.append(contentsOf: result[left...])
                merged.append(contentsOf: current[right...])
                result = merged
            }
            
            return result
        }
        """,
        sections: [
            CodeSection(
                code: "for i in 1..<arrays.count { ... }",
                complexity: "O(n)",
                explanation: "Processes each array once",
                lineNumbers: "4"
            ),
            CodeSection(
                code: "while left < result.count && right < current.count { ... }",
                complexity: "O(n log n)",
                explanation: "Merging operation for each array pair",
                lineNumbers: "9-17"
            )
        ],
        difficulty: .medium,
        expectedComplexity: "O(n log n)",
        explanation: "The algorithm merges arrays in pairs, similar to merge sort. For k arrays of length n, we perform k-1 merges, and each merge operation takes O(n) time. The overall process creates a balanced merge tree with log k levels, resulting in O(n log n) time complexity."
    )
]
