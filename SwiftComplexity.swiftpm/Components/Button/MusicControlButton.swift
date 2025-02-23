import SwiftUI

struct MusicControlButton: View {
    @StateObject private var audioManager = AudioManager.shared
    @State private var showingModal = false
    
    var body: some View {
        Button(action: {
            showingModal = true
        }) {
            Image(systemName: audioManager.isPlaying ? "speaker.wave.2.fill" : "speaker.slash.fill")
                .foregroundColor(.secondary)
                .font(.system(size: 20))
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(Circle())
        }
        .sheet(isPresented: $showingModal) {
            NavigationView {
                VStack(spacing: 24) {
                    // Music Control Section
                    VStack(spacing: 16) {
                        Text("Background Music")
                            .font(.title2)
                            .bold()
                        
                        Button(action: {
                            audioManager.toggleMusic()
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: audioManager.isPlaying ? "speaker.wave.2.fill" : "speaker.slash.fill")
                                    .font(.title2)
                                Text(audioManager.isPlaying ? "Turn Off Music" : "Turn On Music")
                                    .font(.headline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .foregroundColor(audioManager.isPlaying ? .blue : .secondary)
                            .cornerRadius(12)
                        }
                    }
                    
                    Divider()
                    
                    // Credits Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Credits")
                            .font(.title2)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Background Music")
                                .font(.headline)
                            Text("\"Bread\" by Lukrembo")
                                .foregroundColor(.secondary)
                            Text("Source: freetouse.com")
                                .foregroundColor(.secondary)
                            Text("Licensed under Royalty Free Music for Videos")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Settings & About")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            showingModal = false
                        }
                    }
                }
            }
        }
    }
}
