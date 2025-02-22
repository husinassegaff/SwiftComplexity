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
    )
]
