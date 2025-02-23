import AVFoundation
import SwiftUI

@MainActor
class AudioManager: ObservableObject, @unchecked Sendable {
    static let shared = AudioManager()
    private var audioPlayer: AVAudioPlayer?
    @Published var isPlaying: Bool = false
    
    private init() {
        setupAudio()
    }
    
    private func setupAudio() {
        if let data = NSDataAsset(name: "background_music")?.data {
            do {
                try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                audioPlayer = try AVAudioPlayer(data: data)
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.setVolume(0.5, fadeDuration: 0)
                
            } catch {
                print("Failed to initialize audio player: \(error)")
            }
        } else {
            print("Failed to find background music in assets")
        }
    }
    
    func toggleMusic() {
        if isPlaying {
            stopMusic()
        } else {
            playMusic()
        }
    }
    
    func playMusic() {
        audioPlayer?.play()
        isPlaying = true
    }
    
    func stopMusic() {
        audioPlayer?.stop()
        isPlaying = false
    }
    
    func adjustVolume(_ volume: Float) {
        audioPlayer?.volume = volume
    }
}
