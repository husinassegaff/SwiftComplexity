import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LearningView()
                .tabItem {
                    Label("Learning", systemImage: "book.fill")
                }
                .tag(0)
            
            ExerciseView()
                .tabItem {
                    Label("Exercise", systemImage: "pencil.circle.fill")
                }
                .tag(1)
        }
    }
}
