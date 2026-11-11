import SwiftUI

// MARK: DefaultTabView

struct DefaultTabView: View {
    
    /**
     How a tap works ?
     1. The app launches with selecetdTab == 0, so the tab tagged 0 (Home) is shown.
     2. The user taps "Settings" in the tab bar.
     3. The TabView writes that tab's tag, 1, into selecetdTab through the binding.
     4. The state changed, so SwiftUI redraws body, and the tab tagged 1 (Settings) is now selected.
     */
    
    @State private var selecetdTab = 0
    var body: some View {
        TabView(selection: $selecetdTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(1)
        }
        .tint(.monsterShadeOne)
    }
}

#Preview {
    DefaultTabView()
}

struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}
