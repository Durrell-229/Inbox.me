import SwiftUI

struct GlassTabBar: View {
    @Binding var selectedTab: Int
    
    private let tabs: [(icon: String, selectedIcon: String)] = [
        ("house", "house.fill"),
        ("magnifyingglass", "magnifyingglass"),
        ("plus.app", "plus.app.fill"),
        ("heart", "heart.fill"),
        ("person", "person.fill")
    ]
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id: \.self) { index in
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                        selectedTab = index
                    }
                } label: {
                    Image(systemName: selectedTab == index ? tabs[index].selectedIcon : tabs[index].icon)
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(selectedTab == index ? Color.inboxPrimary : .white.opacity(0.55))
                        .frame(maxWidth: .infinity)
                        .scaleEffect(selectedTab == index ? 1.18 : 1.0)
                }
            }
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 10)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(.white.opacity(0.18), lineWidth: 1))
        .shadow(color: .black.opacity(0.45), radius: 25, y: 12)
    }
}
