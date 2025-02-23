let ComplexityExamples = [
    CodeExample(
        title: "Constant Time - O(1)",
        complexity: "O(1)",
        code: """
        func getFirstElement<T>(_ array: [T]) -> T? {
            guard !array.isEmpty else { return nil }
            return array[0]  // Direct array access
        }
        
        func isEven(_ number: Int) -> Bool {
            return number % 2 == 0  // Simple calculation
        }
        """,
        explanation: "These operations take the same time regardless of input size."
    ),
    
    CodeExample(
        title: "Logarithmic Time - O(log n)",
        complexity: "O(log n)",
        code: """
        func binarySearch(_ array: [Int], target: Int) -> Int? {
            var left = 0
            var right = array.count - 1
            
            while left <= right {
                let mid = (left + right) / 2
                if array[mid] == target { return mid }
                if array[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            return nil
        }
        """,
        explanation: "Binary search reduces the problem size by half in each step."
    ),
    
    CodeExample(
        title: "Linear Time - O(n)",
        complexity: "O(n)",
        code: """
        func findMax(_ array: [Int]) -> Int? {
            guard !array.isEmpty else { return nil }
            var max = array[0]
            
            for num in array {
                if num > max {
                    max = num
                }
            }
            return max
        }
        """,
        explanation: "The algorithm needs to visit each element exactly once."
    ),
    
    CodeExample(
        title: "Quadratic Time - O(n²)",
        complexity: "O(n²)",
        code: """
        func bubbleSort(_ array: inout [Int]) {
            let n = array.count
            for i in 0..<n {
                for j in 0..<(n-i-1) {
                    if array[j] > array[j+1] {
                        array.swapAt(j, j+1)
                    }
                }
            }
        }
        """,
        explanation: "Nested loops result in processing each element for every other element."
    ),
    
    CodeExample(
        title: "Exponential Time - O(2ⁿ)",
        complexity: "O(2ⁿ)",
        code: """
        func fibonacci(_ n: Int) -> Int {
            if n <= 1 { return n }
            return fibonacci(n - 1) + fibonacci(n - 2)
        }
        """,
        explanation: "Each call creates two more recursive calls, leading to exponential growth."
    )
]
