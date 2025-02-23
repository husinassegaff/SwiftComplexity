import SwiftUI
import SwiftData

@main
struct MyApp: App {
    @StateObject private var navigationManager = NavigationManager()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            QuizResult.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
