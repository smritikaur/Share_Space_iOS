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

// MARK: CustomTabBar View

struct CustomTabBarView: View {
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

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    var onCenterTap: () -> Void = {}
    let tabs = [
        TabItem(icon: "house.fill", title: "Home"),
        TabItem(icon: "magnifyingglass", title: "Search"),
        TabItem(icon: "heart.fill", title: "Favorites"),
        TabItem(icon: "person.fill", title: "Profile")
    ]
    
    var body: some View {
        HStack {
            ForEach(tabs.indices, id: \.self) { index in
                Spacer()
                TabBarButton(item: tabs[index], isSelected: selectedTab == index) {
                    withAnimation(.spring(response: 0.3)) {
                        selectedTab = index
                    }
                }
                Spacer()
            }
        }
        .padding(.vertical, 12)
        .background(
        RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient(
                    colors: [.indigo, .purple, .pink],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .shadow(color: .black.opacity(0.15), radius: 10, y: 5)
        )
        .overlay(alignment: .top) {
            CenterButton(action: onCenterTap)
                .offset(y: -28)   // raise it above the bar
        }
        .padding(.horizontal)
    }
}

struct CenterButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            if #available(iOS 26.0, *) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 60, height: 60)
//                    .glassEffect(.regular.tint(.blue).interactive(), in: .circle)
                    .glassEffect(.clear.interactive(), in: .circle)
                    .overlay(
                        Circle().stroke(Color(.systemBackground), lineWidth: 4) // ring that "cuts" into the bar
                    )
            } else {
                // Fallback on earlier versions
            }
        }
        .buttonStyle(.plain)
    }
}

struct TabItem {
    let icon: String
    let title: String
}

struct TabBarButton: View {
    let item: TabItem
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            if #available(iOS 26.0, *) {
                VStack(spacing: 4) {
                    Image(systemName: item.icon)
                        .font(.system(size: 20))
                    Text(item.title)
                        .font(.caption2)
                }
                .foregroundColor(isSelected ? .blue : .gray)
                .padding(.horizontal, 16)       // room inside the capsule
                .padding(.vertical, 8)
                .contentShape(.capsule)
                .glassEffect(isSelected
                             ? .clear.interactive()
                             : .identity,
                             in: .capsule)
                .scaleEffect(isSelected ? 1.1 : 1.0)
                
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

