import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        @Bindable var appState = appState
        
        ZStack(alignment: .bottom) {
            // Background
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
                switch appState.selectedTab {
                case 0:
                    HomeView()
                case 1:
                    ExploreView()
                case 2:
                    CreatePostView()
                case 3:
                    NotificationsView()
                case 4:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Glass Tab Bar
            GlassTabBar(selectedTab: $appState.selectedTab)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
        }
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}
