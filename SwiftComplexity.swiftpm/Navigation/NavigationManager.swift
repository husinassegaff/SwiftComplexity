import SwiftUI

class NavigationManager: ObservableObject {
    
    enum Route: Hashable {
        case learn
        case exercise
        case quiz(difficulty: Difficulty)
        case scores
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .learn:
                hasher.combine(0)
            case .exercise:
                hasher.combine(1)
            case .quiz(let difficulty):
                hasher.combine(2)
                hasher.combine(difficulty)
            case .scores:
                hasher.combine(3)
            }
        }
        
        static func == (lhs: Route, rhs: Route) -> Bool {
            switch (lhs, rhs) {
            case (.learn, .learn),
                (.exercise, .exercise),
                (.scores, .scores):
                return true
            case (.quiz(let lDifficulty), .quiz(let rDifficulty)):
                return lDifficulty == rDifficulty
            default:
                return false
            }
        }
    }
    
    @Published var learnPath: NavigationPath = NavigationPath()
    @Published var exercisePath: NavigationPath = NavigationPath()
    @Published var scoresPath: NavigationPath = NavigationPath()
    
    @Published var activeTab: Int = 0
    
    var currentPath: NavigationPath {
        switch activeTab {
        case 0:
            return learnPath
        case 1:
            return exercisePath
        case 2:
            return scoresPath
        default:
            return learnPath
        }
    }
    
    func setPath(_ path: NavigationPath) {
        switch activeTab {
        case 0:
            learnPath = path
        case 1:
            exercisePath = path
        case 2:
            scoresPath = path
        default:
            break
        }
    }
    
    @MainActor @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .learn:
            LearningView()
        case .exercise:
            ExerciseView()
        case .quiz(let difficulty):
            QuizView(difficulty: difficulty)
        case .scores:
            ScoresView()
        }
    }
    
    func navigateTo(_ route: Route) {
        switch activeTab {
        case 0:
            learnPath.append(route)
        case 1:
            exercisePath.append(route)
        case 2:
            scoresPath.append(route)
        default:
            break
        }
    }

    func navigateBack() {
        switch activeTab {
        case 0:
            if !learnPath.isEmpty {
                learnPath.removeLast()
            }
        case 1:
            if !exercisePath.isEmpty {
                exercisePath.removeLast()
            }
        case 2:
            if !scoresPath.isEmpty {
                scoresPath.removeLast()
            }
        default:
            break
        }
    }

    func popToRoot() {
        switch activeTab {
        case 0:
            learnPath.removeLast(learnPath.count)
        case 1:
            exercisePath.removeLast(exercisePath.count)
        case 2:
            scoresPath.removeLast(scoresPath.count)
        default:
            break
        }
    }
}
