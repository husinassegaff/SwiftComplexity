let TimeComplexityTheory = [
    LearningMaterial(
        title: "Understanding Time Complexity",
        content: """
        Time complexity is a fundamental concept in computer science that helps us understand how an algorithm's performance scales with input size. When we analyze time complexity, we're essentially measuring the relationship between the size of the input and the number of operations the algorithm needs to perform.

        In practical software engineering, we focus on worst-case time complexity (Big O notation) for three critical reasons:

        1. It provides a guaranteed upper bound on execution time, helping us make reliable performance predictions
        2. It ensures our algorithms can handle the most challenging scenarios effectively
        3. It serves as a universal standard for comparing different algorithms

        By understanding time complexity, developers can make informed decisions about algorithm selection and optimization strategies. This knowledge is particularly valuable when working with large-scale systems where performance is crucial.
        """
    ),
    
    LearningMaterial(
        title: "Big O Notation Categories",
        content: """
        Understanding different time complexity categories is essential for algorithm analysis. Here's a comprehensive overview from fastest to slowest:

        • O(1) - Constant Time: The algorithm performs the same number of operations regardless of input size. Examples include array indexing, basic arithmetic operations, and hash table lookups.

        • O(log n) - Logarithmic Time: The algorithm's operations grow logarithmically with input size. Common in divide-and-conquer algorithms like binary search. Each step reduces the problem size by a constant factor.

        • O(n) - Linear Time: The number of operations grows linearly with input size. Typical in algorithms that need to process each input element exactly once, like linear search or array traversal.

        • O(n log n) - Linearithmic Time: Combines linear and logarithmic growth. This is the optimal time complexity for comparison-based sorting algorithms like merge sort and quicksort.

        • O(n²) - Quadratic Time: Operations grow with the square of input size. Common in nested iterations and simple sorting algorithms like bubble sort. Performance degrades significantly with larger inputs.

        • O(2ⁿ) - Exponential Time: The number of operations doubles with each additional input element. Often seen in naive recursive solutions to complex problems. Generally indicates the need for optimization.
        """
    ),
    
    LearningMaterial(
        title: "Using Asymptotic Analysis",
        content: """
        Asymptotic analysis is a powerful tool for understanding algorithm efficiency at scale. When we analyze algorithms using Big O notation, we focus on their behavior with large inputs because this reveals their fundamental performance characteristics.

        Here's why asymptotic analysis is particularly valuable:

        • Real-world Application: It helps predict how algorithms will perform with production-scale data
        • Performance Guarantees: It provides clear upper bounds for resource requirements
        • Simplified Comparison: It makes it easier to compare different algorithms by focusing on their essential growth patterns

        Key principles of asymptotic analysis:

        • We drop constants because they become insignificant at scale
        • We focus on the dominant term as input size grows
        • We consider worst-case scenarios for reliable performance predictions

        For example, an algorithm with time complexity O(2n + 10) simplifies to O(n) because the constant terms become negligible with large inputs.
        """
    ),
    
    LearningMaterial(
        title: "Important Rules to Remember",
        content: """
        Understanding these fundamental rules is crucial for accurate time complexity analysis. Let's explore each principle in detail:

        1. Drop Constants:
           • O(2n) becomes O(n)
           • O(100n) becomes O(n)
           • This simplification helps focus on growth patterns rather than implementation details

        2. Drop Lower Order Terms:
           • O(n² + n) becomes O(n²)
           • O(n³ + n² + n) becomes O(n³)
           • The highest order term dominates as input size increases

        3. Addition vs Multiplication Rules:
           • Sequential operations ADD:
             - O(n) + O(n) = O(2n) = O(n)
             - This applies when algorithms run one after another
           
           • Nested operations MULTIPLY:
             - O(n) * O(n) = O(n²)
             - This applies when one algorithm runs inside another

        These rules help us analyze complex algorithms by breaking them down into simpler components and understanding how they combine.
        """
    )
]
