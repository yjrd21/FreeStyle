import SwiftUI
import SwiftData


struct ContentView: View {
    var body: some View {
        ZStack {
            VideoBackgroundView()
            
            VStack {
                Text("FreeStyleLab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                // Add your buttons, inputs, etc.
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
