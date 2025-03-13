import SwiftUI

struct ContentView: View {
    @State private var exhibitions = Exhibition.sampleData
    
    var body: some View {
        TabView {
            HomePageView(exhibitions: $exhibitions)
                .tabItem { Label("Home", systemImage: "house") }
            
            MapView(exhibitions: exhibitions)
                .tabItem { Label("Map", systemImage: "map") }
        }
        .accentColor(.purple)
    }
}

#Preview {
    ContentView()
}
