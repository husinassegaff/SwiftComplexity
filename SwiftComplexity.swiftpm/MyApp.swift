import SwiftUI
import SwiftData

@main
struct MyApp: App {
    @StateObject private var navigationManager = NavigationManager()
    @StateObject private var audioManager = AudioManager.shared
    @Environment(\.scenePhase) private var scenePhase
    
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
                .onAppear {
                    audioManager.playMusic()
                }
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .active:
                if audioManager.isPlaying {
                    audioManager.playMusic()
                }
            case .inactive, .background:
                audioManager.stopMusic()
            @unknown default:
                break
            }
        }
    }
}
