import SwiftUI
import AVKit

struct VideoBackgroundView: View {
    private let player: AVPlayer

    init() {
        guard let url = Bundle.main.url(forResource: "LiquidGradient", withExtension: "mp4") else {
            fatalError("LiquidGradient.mp4 not found in bundle.")
        }

        self.player = AVPlayer(url: url)
        self.player.isMuted = true
        self.player.actionAtItemEnd = .none
    }

    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                player.play()
                NotificationCenter.default.addObserver(
                    forName: .AVPlayerItemDidPlayToEndTime,
                    object: player.currentItem,
                    queue: .main
                ) { _ in
                    player.seek(to: .zero)
                    player.play()
                    player.rate = 0.5
                }
            }
    }
}
