import SwiftUI

struct ContentView: View {
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some View {
        TabView(selection: Binding(
            get: { navigationManager.activeTab },
            set: { navigationManager.activeTab = $0 }
        )) {
            NavigationStack(path: Binding(
                get: { navigationManager.learnPath },
                set: { navigationManager.setPath($0) }
            )) {
                LearningView()
                    .environmentObject(navigationManager)
                    .navigationDestination(for: NavigationManager.Route.self) { route in
                        navigationManager.view(for: route)
                    }
            }
            .tabItem {
                Label("Learning", systemImage: "book.fill")
            }
            .tag(0)
            
            NavigationStack(path: Binding(
                get: { navigationManager.exercisePath },
                set: { navigationManager.setPath($0) }
            )) {
                ExerciseView()
                    .environmentObject(navigationManager)
                    .navigationDestination(for: NavigationManager.Route.self) { route in
                        navigationManager.view(for: route)
                    }
            }
            .tabItem {
                Label("Exercise", systemImage: "pencil.circle.fill")
            }
            .tag(1)
        }
        .environmentObject(navigationManager)
    }
}
