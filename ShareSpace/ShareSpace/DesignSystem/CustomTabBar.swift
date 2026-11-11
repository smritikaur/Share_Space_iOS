import SwiftUI

// MARK: CustomTabBar

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

#Preview {
    CustomTabBar(selectedTab: .constant(0))
}
