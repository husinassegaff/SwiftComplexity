# SwiftComplexity

SwiftComplexity is an interactive iPad quiz game that helps learners determine time complexity through code-based quizzes and asymptotic analysis, making algorithmic efficiency easier to understand without memorization

## Features

### 1. Learning Module
- **Theoretical Concepts**: Comprehensive explanations of time complexity fundamentals
- **Interactive Code Examples**: Real-world examples with detailed complexity analysis

### 2. Exercise Module
- **Multi-Level Quizzes**: 
  - Easy, Medium, and Hard difficulty levels
  - 5 carefully selected algorithm problems per quiz
  - Real-time scoring and feedback
- **Interactive Features**:
  - Drawing canvas for visualization
  - Smart hints system (with time penalties)
  - Code snippet analysis
  - Detailed explanations for each answer
- **Timed Challenges**: Track your solving speed with an integrated timer

### 3. Progress Tracking
- **High Score System**: Track your best performances
- **History Section**: Review past quiz attempts

### 4. Additional Features
- **Background Music**: Optional ambient music for focused learning
- **Responsive UI**: Optimized for iPad in landscape orientation

## Technical Details

### Technology Stack
- **Framework**: SwiftUI
- **iOS Version**: iOS 17.0+
- **Data Persistence**: SwiftData
- **Device Support**: iPad
- **Orientation**: Landscape

### Project Structure
```
SwiftComplexity/
├── Audio/                  # Audio management
├── Components/             # Reusable UI components
│   ├── Button/
│   ├── Card/
│   └── Row/
├── Enum/                   # Enumerations
├── LearnData/              # Learning content
├── Media.xcassets/         # Media assets
├── Model/                  # Data models
├── Navigation/             # Navigation management
├── QuizData/               # Quiz questions and answers
├── View/                   # UI views
│   ├── Exercise/
│   ├── Learning/
│   └── Scores/
└── ViewModel/              # View models
```

### Key Components
- **AudioManager**: Handles background music playback
- **NavigationManager**: Manages app navigation and routing
- **QuizViewModel**: Controls quiz logic and scoring
- **SwiftData Models**: Handles data persistence for quiz results

## Credits

### Music
- **Track**: "Bread"
- **Artist**: Lukrembo
- **Source**: freetouse.com
- **License**: Royalty Free Music for Videos

## Requirements
- iOS 17.0 or later
- iPad device
- Xcode 15.0+ for development

## Installation
1. Clone the repository
2. Open the project in Xcode
3. Build and run on an iPad device or simulator