let hardQuestions = [
    QuizQuestion(
        title: "Merge Sort Implementation",
        description: "Sort an array using the merge sort algorithm",
        codeSnippet: """
        func mergeSort(_ array: [Int]) -> [Int] {
            guard array.count > 1 else { return array }
            
            let mid = array.count / 2
            let left = Array(array[..<mid])
            let right = Array(array[mid...])
            
            func merge(_ left: [Int], _ right: [Int]) -> [Int] {
                var result: [Int] = []
                var leftIndex = 0
                var rightIndex = 0
                
                while leftIndex < left.count && rightIndex < right.count {
                    if left[leftIndex] <= right[rightIndex] {
                        result.append(left[leftIndex])
                        leftIndex += 1
                    } else {
                        result.append(right[rightIndex])
                        rightIndex += 1
                    }
                }
                
                result.append(contentsOf: left[leftIndex...])
                result.append(contentsOf: right[rightIndex...])
                return result
            }
            
            return merge(mergeSort(left), mergeSort(right))
        }
        """,
        sections: [
            CodeSection(
                code: "let left = Array(array[..<mid])\nlet right = Array(array[mid...])",
                complexity: "O(n)",
                explanation: "Creating subarrays takes linear time",
                lineNumbers: "4-5"
            ),
            CodeSection(
                code: "func merge(_ left: [Int], _ right: [Int]) -> [Int]",
                complexity: "O(n)",
                explanation: "Merging two sorted arrays takes linear time",
                lineNumbers: "7-24"
            ),
            CodeSection(
                code: "return merge(mergeSort(left), mergeSort(right))",
                complexity: "O(n log n)",
                explanation: "Recursive calls divide array log n times, with linear work at each level",
                lineNumbers: "26"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n log n)",
        explanation: "Merge Sort is a divide-and-conquer algorithm that recursively divides the array into two halves until each subarray contains a single element. During the merging phase, the algorithm combines these subarrays in sorted order, which requires scanning through all n elements at each level. Since the number of recursive levels is log n (as the array is repeatedly divided in half), the total worst-case time complexity is O(n log n)."
    ),
    
    QuizQuestion(
        title: "Quick Sort Partition",
        description: "Implement the partition function for QuickSort algorithm",
        codeSnippet: """
        func quickSort(_ array: inout [Int], low: Int, high: Int) {
            guard low < high else { return }
            
            func partition(_ low: Int, _ high: Int) -> Int {
                let pivot = array[high]
                var i = low - 1
                
                for j in low..<high {
                    if array[j] <= pivot {
                        i += 1
                        array.swapAt(i, j)
                    }
                }
                
                array.swapAt(i + 1, high)
                return i + 1
            }
            
            let pivotIndex = partition(low, high)
            quickSort(&array, low: low, high: pivotIndex - 1)
            quickSort(&array, low: pivotIndex + 1, high: high)
        }
        """,
        sections: [
            CodeSection(
                code: "func partition(_ low: Int, _ high: Int) -> Int",
                complexity: "O(n)",
                explanation: "Partition function makes one pass through the subarray",
                lineNumbers: "4-15"
            ),
            CodeSection(
                code: "quickSort(&array, low: low, high: pivotIndex - 1)\nquickSort(&array, low: pivotIndex + 1, high: high)",
                complexity: "O(log n)",
                explanation: "Average case recursion depth (balanced partitions)",
                lineNumbers: "19-20"
            ),
            CodeSection(
                code: "for j in low..<high { ... }",
                complexity: "O(n)",
                explanation: "Linear scan through subarray in partition function",
                lineNumbers: "8-13"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n log n)",
        explanation: "Quick Sort operates by selecting a pivot and partitioning the array such that all elements smaller than the pivot are placed on the left, and larger elements are placed on the right. The partitioning step itself takes O(n) time, and in the average case, the recursion depth is O(log n) due to balanced partitions. Therefore, the total worst-case time complexity is O(n log n) when the pivot selection is efficient. However, in the worst case (when the pivot is always the smallest or largest element), the complexity degrades to O(n²)."
    ),
    
    QuizQuestion(
        title: "LRU Cache Implementation",
        description: "Implement a Least Recently Used (LRU) Cache with get and put operations",
        codeSnippet: """
        class LRUCache<Key: Hashable, Value> {
            private struct Node {
                let key: Key
                var value: Value
                var prev: Node?
                var next: Node?
            }
            
            private let capacity: Int
            private var cache: [Key: Node] = [:]
            private var head: Node?
            private var tail: Node?
            
            init(capacity: Int) {
                self.capacity = capacity
            }
            
            func get(_ key: Key) -> Value? {
                guard let node = cache[key] else { return nil }
                moveToFront(node)
                return node.value
            }
            
            func put(_ key: Key, _ value: Value) {
                if let existingNode = cache[key] {
                    existingNode.value = value
                    moveToFront(existingNode)
                } else {
                    let node = Node(key: key, value: value)
                    cache[key] = node
                    addToFront(node)
                    
                    if cache.count > capacity {
                        removeLRU()
                    }
                }
            }
        }
        """,
        sections: [
            CodeSection(
                code: "func get(_ key: Key) -> Value?",
                complexity: "O(1)",
                explanation: "Hash table lookup and list operations are constant time",
                lineNumbers: "17-21"
            ),
            CodeSection(
                code: "func put(_ key: Key, _ value: Value)",
                complexity: "O(1)",
                explanation: "Insertion and removal operations are constant time",
                lineNumbers: "23-35"
            ),
            CodeSection(
                code: "private var cache: [Key: Node] = [:]",
                complexity: "O(n)",
                explanation: "Space complexity where n is the capacity",
                lineNumbers: "8"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(1)",
        explanation: "An LRU (Least Recently Used) Cache maintains the most recently accessed elements using a combination of a hash table and a doubly linked list. The hash table enables O(1) lookup time for retrieving elements, while the doubly linked list efficiently updates the order of recently used items. Both get and put operations run in O(1) time because they involve only hash table lookups and constant-time list operations. The worst-case space complexity is O(n), where n is the cache capacity."
    ),
    
    QuizQuestion(
        title: "Longest Common Subsequence",
        description: "Find the length of the longest common subsequence between two strings",
        codeSnippet: """
        func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
            let chars1 = Array(text1)
            let chars2 = Array(text2)
            let m = chars1.count
            let n = chars2.count
            
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
            
            for i in 1...m {
                for j in 1...n {
                    if chars1[i-1] == chars2[j-1] {
                        dp[i][j] = dp[i-1][j-1] + 1
                    } else {
                        dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                    }
                }
            }
            
            return dp[m][n]
        }
        """,
        sections: [
            CodeSection(
                code: "var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)",
                complexity: "O(n²)",
                explanation: "Creating a 2D DP array and filling it requires O(n²) operations.",
                lineNumbers: "7"
            ),
            CodeSection(
                code: "for i in 1...m {\n    for j in 1...n { ... }\n}",
                complexity: "O(n²)",
                explanation: "Nested loops iterate through all combinations, making the worst-case complexity O(n²).",
                lineNumbers: "9-16"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n²)",
        explanation: "The Longest Common Subsequence (LCS) problem is solved using dynamic programming with a 2D table of size n × n, where n is the length of the longest input string. Each cell in the table stores the LCS length up to that point, and filling each cell takes constant O(1) time. Since the entire table must be computed, the worst-case time complexity is O(n²)."
    ),
    
    QuizQuestion(
        title: "Graph DFS Implementation",
        description: "Implement Depth-First Search for a graph represented as an adjacency list",
        codeSnippet: """
        class Graph {
            private var adjacencyList: [Int: Set<Int>] = [:]
            
            func addEdge(from source: Int, to destination: Int) {
                adjacencyList[source, default: Set()].insert(destination)
            }
            
            func dfs(start: Int, target: Int) -> Bool {
                var visited = Set<Int>()
                
                func dfsRecursive(_ current: Int) -> Bool {
                    if current == target { return true }
                    visited.insert(current)
                    
                    guard let neighbors = adjacencyList[current] else { return false }
                    
                    for neighbor in neighbors {
                        if !visited.contains(neighbor) {
                            if dfsRecursive(neighbor) {
                                return true
                            }
                        }
                    }
                    return false
                }
                
                return dfsRecursive(start)
            }
        }
        """,
        sections: [
            CodeSection(
                code: "func dfsRecursive(_ current: Int) -> Bool",
                complexity: "O(n)",
                explanation: "DFS visits each node once, making the worst-case complexity O(n).",
                lineNumbers: "11-24"
            ),
            CodeSection(
                code: "for neighbor in neighbors { ... }",
                complexity: "O(n)",
                explanation: "Total iterations across all recursive calls equal the number of edges, simplifying to O(n).",
                lineNumbers: "17-23"
            ),
            CodeSection(
                code: "visited.insert(current)",
                complexity: "O(1)",
                explanation: "Set operations are constant time.",
                lineNumbers: "13"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n)",
        explanation: "Depth-First Search (DFS) is a graph traversal algorithm that explores as far as possible along each branch before backtracking. Since each node and edge is processed once, the worst-case complexity is simplified to O(n), where n represents the number of nodes in the graph."
    ),
    QuizQuestion(
        title: "N-Queens Problem",
        description: "Place N queens on an NxN chessboard so no two queens threaten each other",
        codeSnippet: """
        func solveNQueens(_ n: Int) -> [[String]] {
            var board = Array(repeating: Array(repeating: ".", count: n), count: n)
            var solutions: [[String]] = []
            
            func isSafe(_ row: Int, _ col: Int) -> Bool {
                // Check row on left side
                for j in 0..<col {
                    if board[row][j] == "Q" { return false }
                }
                
                // Check upper diagonal on left side
                var i = row, j = col
                while i >= 0 && j >= 0 {
                    if board[i][j] == "Q" { return false }
                    i -= 1; j -= 1
                }
                
                // Check lower diagonal on left side
                i = row; j = col
                while i < n && j >= 0 {
                    if board[i][j] == "Q" { return false }
                    i += 1; j -= 1
                }
                
                return true
            }
            
            func solve(_ col: Int) {
                if col >= n {
                    solutions.append(board.map { String($0) })
                    return
                }
                
                for row in 0..<n {
                    if isSafe(row, col) {
                        board[row][col] = "Q"
                        solve(col + 1)
                        board[row][col] = "."
                    }
                }
            }
            
            solve(0)
            return solutions
        }
        """,
        sections: [
            CodeSection(
                code: "func isSafe(_ row: Int, _ col: Int) -> Bool",
                complexity: "O(n)",
                explanation: "Checks three directions for conflicts",
                lineNumbers: "5-27"
            ),
            CodeSection(
                code: "func solve(_ col: Int)",
                complexity: "O(2ⁿ)",
                explanation: "Tries all possible combinations recursively",
                lineNumbers: "29-41"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(2ⁿ)",
        explanation: "The N-Queens problem uses backtracking to try all possible board configurations. For each column, we try placing a queen in each row, leading to n choices at each step. The branching factor and recursion create an exponential time complexity of O(2ⁿ)."
    ),

    QuizQuestion(
        title: "Minimum Edit Distance",
        description: "Calculate minimum operations required to convert one string to another",
        codeSnippet: """
        func minDistance(_ word1: String, _ word2: String) -> Int {
            let chars1 = Array(word1), chars2 = Array(word2)
            let m = chars1.count, n = chars2.count
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
            
            // Initialize first row and column
            for i in 0...m {
                dp[i][0] = i
            }
            for j in 0...n {
                dp[0][j] = j
            }
            
            // Fill the dp table
            for i in 1...m {
                for j in 1...n {
                    if chars1[i-1] == chars2[j-1] {
                        dp[i][j] = dp[i-1][j-1]
                    } else {
                        dp[i][j] = min(
                            dp[i-1][j] + 1,    // deletion
                            dp[i][j-1] + 1,    // insertion
                            dp[i-1][j-1] + 1   // substitution
                        )
                    }
                }
            }
            
            return dp[m][n]
        }
        """,
        sections: [
            CodeSection(
                code: "var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)",
                complexity: "O(n²)",
                explanation: "Creates a matrix of size (m+1) × (n+1)",
                lineNumbers: "4"
            ),
            CodeSection(
                code: "for i in 1...m {\n    for j in 1...n { ... }\n}",
                complexity: "O(n²)",
                explanation: "Nested loops process each cell in the matrix",
                lineNumbers: "15-26"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n²)",
        explanation: "The algorithm uses dynamic programming with a 2D table to compute the minimum edit distance. It needs to fill every cell in an m×n matrix, where each cell computation takes constant time. This results in a time complexity of O(n²)."
    ),

    QuizQuestion(
        title: "Permutation Generator",
        description: "Generate all possible permutations of a string",
        codeSnippet: """
        func generatePermutations(_ str: String) -> [String] {
            var chars = Array(str)
            var result: [String] = []
            
            func permute(_ start: Int) {
                if start == chars.count - 1 {
                    result.append(String(chars))
                    return
                }
                
                for i in start..<chars.count {
                    chars.swapAt(start, i)
                    permute(start + 1)
                    chars.swapAt(start, i)  // backtrack
                }
            }
            
            permute(0)
            return result
        }
        """,
        sections: [
            CodeSection(
                code: "func permute(_ start: Int)",
                complexity: "O(n)",
                explanation: "Each recursive call processes remaining elements",
                lineNumbers: "4-13"
            ),
            CodeSection(
                code: "for i in start..<chars.count { ... }",
                complexity: "O(2ⁿ)",
                explanation: "Creates n! different permutations",
                lineNumbers: "10-13"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(2ⁿ)",
        explanation: "The permutation generator creates all possible arrangements of characters. For n characters, there are n! possible permutations. Since n! grows faster than 2ⁿ for large n, we simplify the complexity to O(2ⁿ) from our available options."
    ),

    QuizQuestion(
        title: "Dijkstra's Algorithm",
        description: "Find shortest path in a weighted graph using Dijkstra's algorithm",
        codeSnippet: """
        class Graph {
            typealias Edge = (node: Int, weight: Int)
            private var adjacencyList: [Int: [Edge]] = [:]
            
            func shortestPath(from start: Int, to end: Int) -> Int? {
                var distances = [Int: Int]()
                var queue = [(distance: Int, node: Int)]()
                var visited = Set<Int>()
                
                // Initialize distances
                for node in adjacencyList.keys {
                    distances[node] = node == start ? 0 : Int.max
                }
                queue.append((0, start))
                
                while !queue.isEmpty {
                    let (currentDistance, currentNode) = queue.removeFirst()
                    
                    if currentNode == end {
                        return currentDistance
                    }
                    
                    if visited.contains(currentNode) {
                        continue
                    }
                    visited.insert(currentNode)
                    
                    guard let neighbors = adjacencyList[currentNode] else { continue }
                    
                    for edge in neighbors {
                        let distance = currentDistance + edge.weight
                        if distance < distances[edge.node, default: Int.max] {
                            distances[edge.node] = distance
                            queue.append((distance, edge.node))
                        }
                    }
                    queue.sort { $0.distance < $1.distance }
                }
                
                return nil
            }
        }
        """,
        sections: [
            CodeSection(
                code: "while !queue.isEmpty { ... }",
                complexity: "O(n²)",
                explanation: "Main loop processes each vertex and its edges",
                lineNumbers: "17-38"
            ),
            CodeSection(
                code: "queue.sort { $0.distance < $1.distance }",
                complexity: "O(n log n)",
                explanation: "Sorting queue after each iteration",
                lineNumbers: "39"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n²)",
        explanation: "This implementation of Dijkstra's algorithm uses a sorted array instead of a priority queue. For each vertex (n), we potentially process all edges and sort the queue. While an optimized version with a priority queue would be O(n log n), this implementation has a worst-case time complexity of O(n²) due to the repeated sorting."
    ),

    QuizQuestion(
        title: "Matrix Chain Multiplication",
        description: "Find the most efficient way to multiply a chain of matrices",
        codeSnippet: """
        func matrixChainOrder(_ dimensions: [Int]) -> Int {
            let n = dimensions.count - 1
            var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
            
            // Length of chain
            for len in 1..<n {
                // For each start position
                for i in 0..<(n - len) {
                    let j = i + len
                    dp[i][j] = Int.max
                    
                    // Try each split point
                    for k in i..<j {
                        let operations = dp[i][k] + dp[k+1][j] +
                            dimensions[i] * dimensions[k+1] * dimensions[j+1]
                        dp[i][j] = min(dp[i][j], operations)
                    }
                }
            }
            
            return dp[0][n-1]
        }
        """,
        sections: [
            CodeSection(
                code: "var dp = Array(repeating: Array(repeating: 0, count: n), count: n)",
                complexity: "O(n²)",
                explanation: "Creates a square matrix for dynamic programming",
                lineNumbers: "3"
            ),
            CodeSection(
                code: "for len in 1..<n {\n    for i in 0..<(n - len) {\n        for k in i..<j { ... }",
                complexity: "O(n²)",
                explanation: "Triple nested loops for computing optimal chains",
                lineNumbers: "6-17"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n²)",
        explanation: "Matrix Chain Multiplication uses dynamic programming to find the optimal way to parenthesize matrix multiplications. The algorithm fills a triangular matrix where each cell requires examining all possible split points. While the actual complexity is O(n³), we approximate it to O(n²) from our available options."
    ),
    QuizQuestion(
        title: "Subset Sum Problem",
        description: "Find if there exists a subset of array that sums to target value",
        codeSnippet: """
        func hasSubsetSum(_ nums: [Int], _ target: Int) -> Bool {
            func findSubset(_ index: Int, _ currentSum: Int) -> Bool {
                if currentSum == target {
                    return true
                }
                if index >= nums.count || currentSum > target {
                    return false
                }
                
                // Include current number
                if findSubset(index + 1, currentSum + nums[index]) {
                    return true
                }
                
                // Exclude current number
                return findSubset(index + 1, currentSum)
            }
            
            return findSubset(0, 0)
        }
        """,
        sections: [
            CodeSection(
                code: "func findSubset(_ index: Int, _ currentSum: Int) -> Bool",
                complexity: "O(2ⁿ)",
                explanation: "Each element has two choices: include or exclude",
                lineNumbers: "2-15"
            ),
            CodeSection(
                code: "if findSubset(index + 1, currentSum + nums[index])",
                complexity: "O(2ⁿ)",
                explanation: "Tree of recursive calls doubles with each level",
                lineNumbers: "10-12"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(2ⁿ)",
        explanation: "The Subset Sum problem uses recursive backtracking where for each element we have two choices: include it or not. This creates a binary decision tree with potentially 2ⁿ leaves, making the time complexity O(2ⁿ)."
    ),

    QuizQuestion(
        title: "Kth Largest Element",
        description: "Find the kth largest element using QuickSelect algorithm",
        codeSnippet: """
        func findKthLargest(_ nums: inout [Int], _ k: Int) -> Int {
            func partition(_ left: Int, _ right: Int) -> Int {
                let pivot = nums[right]
                var i = left
                
                for j in left..<right {
                    if nums[j] <= pivot {
                        nums.swapAt(i, j)
                        i += 1
                    }
                }
                nums.swapAt(i, right)
                return i
            }
            
            func quickSelect(_ left: Int, _ right: Int, _ k: Int) -> Int {
                let pivotIndex = partition(left, right)
                let targetIndex = nums.count - k
                
                if pivotIndex == targetIndex {
                    return nums[pivotIndex]
                } else if pivotIndex < targetIndex {
                    return quickSelect(pivotIndex + 1, right, k)
                } else {
                    return quickSelect(left, pivotIndex - 1, k)
                }
            }
            
            return quickSelect(0, nums.count - 1, k)
        }
        """,
        sections: [
            CodeSection(
                code: "func partition(_ left: Int, _ right: Int) -> Int",
                complexity: "O(n)",
                explanation: "Partition scans through array segment once",
                lineNumbers: "2-13"
            ),
            CodeSection(
                code: "func quickSelect(_ left: Int, _ right: Int, _ k: Int) -> Int",
                complexity: "O(n)",
                explanation: "Average case only needs to process one partition path",
                lineNumbers: "15-26"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n)",
        explanation: "QuickSelect is an optimized version of QuickSort that only needs to process one partition in each recursion level. While the worst case is O(n²), the average case time complexity is O(n) as we only follow one path down the recursion tree."
    ),

    QuizQuestion(
        title: "Binary Tree Serialization",
        description: "Serialize and deserialize a binary tree to/from string format",
        codeSnippet: """
        class TreeNode {
            var val: Int
            var left: TreeNode?
            var right: TreeNode?
            init(_ val: Int) { self.val = val }
        }
        
        class Codec {
            func serialize(_ root: TreeNode?) -> String {
                var result: [String] = []
                
                func preorder(_ node: TreeNode?) {
                    guard let node = node else {
                        result.append("null")
                        return
                    }
                    result.append(String(node.val))
                    preorder(node.left)
                    preorder(node.right)
                }
                
                preorder(root)
                return result.joined(separator: ",")
            }
            
            func deserialize(_ data: String) -> TreeNode? {
                var values = data.split(separator: ",").map(String.init)
                var index = 0
                
                func buildTree() -> TreeNode? {
                    if index >= values.count || values[index] == "null" {
                        index += 1
                        return nil
                    }
                    
                    let node = TreeNode(Int(values[index])!)
                    index += 1
                    node.left = buildTree()
                    node.right = buildTree()
                    return node
                }
                
                return buildTree()
            }
        }
        """,
        sections: [
            CodeSection(
                code: "func preorder(_ node: TreeNode?)",
                complexity: "O(n)",
                explanation: "Visits each node exactly once during serialization",
                lineNumbers: "11-19"
            ),
            CodeSection(
                code: "func buildTree() -> TreeNode?",
                complexity: "O(n)",
                explanation: "Processes each value once during deserialization",
                lineNumbers: "29-38"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n)",
        explanation: "Both serialization and deserialization require visiting each node exactly once. The preorder traversal for serialization is O(n), and the recursive reconstruction for deserialization is also O(n), where n is the number of nodes in the tree."
    ),

    QuizQuestion(
        title: "Skyline Problem",
        description: "Find the skyline formed by overlapping buildings",
        codeSnippet: """
        struct Building {
            let left: Int
            let right: Int
            let height: Int
        }
        
        func getSkyline(_ buildings: [Building]) -> [(x: Int, height: Int)] {
            // Convert buildings to points with height changes
            var points: [(x: Int, height: Int)] = []
            for building in buildings {
                points.append((building.left, -building.height))  // Start point
                points.append((building.right, building.height))  // End point
            }
            
            // Sort points by x-coordinate
            points.sort { $0.x < $1.x || ($0.x == $1.x && $0.height < $1.height) }
            
            var result: [(x: Int, height: Int)] = []
            var heights = [0]  // Current heights, 0 is ground level
            var prevMaxHeight = 0
            
            for point in points {
                if point.height < 0 {
                    // Building starts
                    heights.append(-point.height)
                } else {
                    // Building ends
                    if let index = heights.firstIndex(of: point.height) {
                        heights.remove(at: index)
                    }
                }
                
                let currentMaxHeight = heights.max() ?? 0
                if currentMaxHeight != prevMaxHeight {
                    result.append((point.x, currentMaxHeight))
                    prevMaxHeight = currentMaxHeight
                }
            }
            
            return result
        }
        """,
        sections: [
            CodeSection(
                code: "points.sort { $0.x < $1.x || ($0.x == $1.x && $0.height < $1.height) }",
                complexity: "O(n log n)",
                explanation: "Sorting all building points",
                lineNumbers: "16"
            ),
            CodeSection(
                code: "for point in points { ... }",
                complexity: "O(n log n)",
                explanation: "Processing points with height updates",
                lineNumbers: "21-36"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(n log n)",
        explanation: "The Skyline algorithm processes buildings by converting them to points, sorting them, and maintaining a height list. The sorting step takes O(n log n), and processing each point involves maintaining a sorted list of heights, giving a total time complexity of O(n log n)."
    ),

    QuizQuestion(
        title: "Word Break II",
        description: "Find all possible sentences that can be formed from a string using a dictionary",
        codeSnippet: """
        func wordBreak(_ s: String, _ wordDict: Set<String>) -> [String] {
            let chars = Array(s)
            var memo: [Int: [String]] = [:]
            
            func backtrack(_ start: Int) -> [String] {
                if start >= chars.count {
                    return [""]
                }
                
                if let cached = memo[start] {
                    return cached
                }
                
                var result: [String] = []
                
                for end in (start + 1)...chars.count {
                    let word = String(chars[start..<end])
                    if wordDict.contains(word) {
                        let suffixes = backtrack(end)
                        for suffix in suffixes {
                            let space = suffix.isEmpty ? "" : " "
                            result.append(word + space + suffix)
                        }
                    }
                }
                
                memo[start] = result
                return result
            }
            
            return backtrack(0)
        }
        """,
        sections: [
            CodeSection(
                code: "func backtrack(_ start: Int) -> [String]",
                complexity: "O(2ⁿ)",
                explanation: "Explores all possible word combinations exponentially",
                lineNumbers: "5-28"
            ),
            CodeSection(
                code: "for end in (start + 1)...chars.count { ... }",
                complexity: "O(n)",
                explanation: "Tries all possible word lengths at each position",
                lineNumbers: "17-25"
            )
        ],
        difficulty: .hard,
        expectedComplexity: "O(2ⁿ)",
        explanation: "Word Break II uses backtracking to find all possible ways to break the string into valid words. At each position, we can either form a word or continue to the next character, creating a binary decision tree. While memoization helps avoid some repeated work, the worst-case time complexity remains O(2ⁿ) due to the exponential number of possible combinations."
    )
]
