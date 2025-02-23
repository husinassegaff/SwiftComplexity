let TimeComplexityTheory = [
    LearningMaterial(
        title: "Understanding Time Complexity",
        content: """
        Time complexity is a crucial concept in computer science that measures how an algorithm's execution time grows as its input size increases. In our analysis and exercises, we focus on worst-case time complexity (Big O notation) because:

        1. It provides a guaranteed upper bound on execution time
        2. It helps us prepare for the worst possible scenario
        3. It's most commonly used in practical software engineering
        
        Remember: When we say an algorithm is O(n), we mean its worst-case performance will not grow faster than linear time, even with the most challenging input.
        """
    ),
    
    LearningMaterial(
        title: "Big O Notation Categories",
        content: """
        Common time complexity categories from fastest to slowest:

        • O(1) - Constant Time: Runtime stays the same regardless of input size
        • O(log n) - Logarithmic Time: Runtime grows logarithmically
        • O(n) - Linear Time: Runtime grows linearly with input
        • O(n log n) - Linearithmic Time: Common in efficient sorting algorithms
        • O(n²) - Quadratic Time: Runtime grows with square of input size
        • O(2ⁿ) - Exponential Time: Runtime doubles with each additional element
        """
    ),
    
    LearningMaterial(
        title: "Using Asymptotic Analysis",
        content: """
        When analyzing algorithms, we use asymptotic analysis with a focus on worst-case scenarios (Big O notation) because:

        • It's most relevant for real-world applications
        • It provides performance guarantees
        • It simplifies comparison between algorithms
        
        We ignore constants and lower-order terms because they become less significant as input size grows. For example, O(2n + 10) simplifies to O(n).
        """
    ),
    
    LearningMaterial(
        title: "Important Rules to Remember",
        content: """
        When determining time complexity:

        1. Drop Constants: O(2n) becomes O(n)
        2. Drop Lower Order Terms: O(n² + n) becomes O(n²)
        3. Addition vs Multiplication:
           • Sequential operations ADD: O(n) + O(n) = O(2n) = O(n)
           • Nested operations MULTIPLY: O(n) * O(n) = O(n²)
        """
    )
]
