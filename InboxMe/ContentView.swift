import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background gradient
            LinearGradient(
                colors: [
                    Color(red: 0.08, green: 0.05, blue: 0.15),
                    Color(red: 0.04, green: 0.04, blue: 0.08)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    Text("Search / Explore")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.7))
                case 2:
                    Text("Create Post")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.7))
                case 3:
                    Text("Activity / Reels")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.7))
                case 4:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom Glass Tab Bar
            GlassTabBar(selectedTab: $selectedTab)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
        }
    }
}

#Preview {
    ContentView()
}
