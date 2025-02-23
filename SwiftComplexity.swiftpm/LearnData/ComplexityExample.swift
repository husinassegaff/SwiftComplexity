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
        explanation: """
        Let's analyze both functions line by line:

        getFirstElement:
        1. array.isEmpty check: One operation, regardless of array size → O(1)
        2. array[0] access: One operation, direct memory access → O(1)
        Total: O(1) + O(1) = O(1)

        isEven:
        1. Single modulo operation: One arithmetic operation → O(1)
        Total: O(1)

        When we have multiple O(1) operations, they sum to O(1). Neither function contains loops or recursion, and the number of operations remains constant regardless of input size.
        """
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
        explanation: """
        To analyze binary search's time complexity:

        1. Initial setup (left, right): O(1)
        2. Loop analysis:
           - Each iteration divides search space by 2
           - Input size: n
           - After 1st iteration: n/2
           - After 2nd iteration: n/4
           - After 3rd iteration: n/8
           - Pattern: n → n/2 → n/4 → n/8 → ... → 1
           - Question: How many times can we divide n by 2 until we reach 1?
           - Answer: log₂(n) iterations

        3. Inside each iteration:
           - Calculate mid: O(1)
           - Array access and comparison: O(1)
           - Updating left or right: O(1)
           Total per iteration: O(1)

        Final complexity: O(log n) iterations × O(1) operations per iteration = O(log n)
        """
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
        explanation: """
        Let's break down the time complexity analysis:

        1. Initial operations:
           - Empty check: O(1)
           - Initialize max: O(1)

        2. For loop analysis:
           - Loop runs exactly n times (where n is array size)
           - Each iteration performs:
             * One comparison (num > max): O(1)
             * At most one assignment (max = num): O(1)
           - Per iteration cost: O(1)
           - Total loop cost: n iterations × O(1) = O(n)

        3. Return statement: O(1)

        Total complexity: O(1) + O(1) + O(n) + O(1) = O(n)
        
        We drop the lower-order terms (the O(1) operations) since they become insignificant as n grows.
        """
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
        explanation: """
        Let's analyze the nested loops to determine complexity:

        1. Outer loop (i):
           - Runs from 0 to n-1
           - n iterations

        2. Inner loop (j):
           - First iteration (i=0): n-1 comparisons
           - Second iteration (i=1): n-2 comparisons
           - Third iteration (i=2): n-3 comparisons
           - Pattern: (n-1) + (n-2) + (n-3) + ... + 2 + 1
           - This is an arithmetic sequence sum: (n-1)(n)/2

        3. Each comparison and swap is O(1)

        Total operations:
        - Number of comparisons: (n-1)(n)/2
        - Simplifying: (n² - n)/2
        - Drop lower order term (-n) and constant (/2)
        - Final complexity: O(n²)

        This is why nested loops often result in quadratic time - each element is processed for every other element.
        """
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
        explanation: """
        Let's analyze this recursive implementation:

        1. Base case: 
           - When n ≤ 1: O(1)

        2. Recursive case analysis:
           - Each call creates two more recursive calls
           - Call tree visualization for n=4:
                        fib(4)
                   /            \\
              fib(3)            fib(2)
             /      \\          /     \\
         fib(2)    fib(1)   fib(1)   fib(0)
         /    \\
        fib(1)  fib(0)

        3. Count operations by level:
           - Level 0: 2⁰ = 1 call
           - Level 1: 2¹ = 2 calls
           - Level 2: 2² = 4 calls
           - Level 3: 2³ = 8 calls
           - Tree depth is n levels
           - At each level k: 2ᵏ calls

        4. Total calls = 2⁰ + 2¹ + 2² + ... + 2ⁿ⁻¹ = 2ⁿ - 1

        Final complexity: O(2ⁿ)
        Each recursive call adds another level of exponential growth.
        """
    )
]
