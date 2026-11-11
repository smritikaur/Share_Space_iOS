import SwiftUI

// MARK: MainTabView

struct MainTabView: View {
    /**
     - Key Insight - Separate tab content from tabbar.
     - This ZStack pattern with content behind and tab bar on top is the foundation for every custom tab bar.
     */

    @State private var selectedTab: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            // Content
            TabContent(selectedTab: selectedTab)
            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct TabContent: View {
    let selectedTab: Int
    var body: some View {
        Group {
            switch selectedTab {
            case 0:
                Color.blue.opacity(0.1)
                    .overlay(Text("Home"))
            case 1:
                Color.green.opacity(0.1)
                    .overlay(Text("Settings"))
            case 2:
                Color.orange.opacity(0.1)
                    .overlay(Text("Favs"))
            case 3:
                Color.purple.opacity(0.1)
                    .overlay(Text("Profile"))
            default:
                EmptyView()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
