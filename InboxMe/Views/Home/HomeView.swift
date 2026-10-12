import SwiftUI

struct HomeView: View {
    @Environment(AppState.self) private var appState
    @State private var showMessages = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Text("Inbox.me")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.inboxPrimary, .inboxSecondary],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Spacer()
                    
                    Button {
                        showMessages = true
                    } label: {
                        Image(systemName: "paperplane")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.white.opacity(0.9))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 12)
                
                // Stories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        StoryCircle(username: "Toi", isAdd: true)
                        
                        ForEach(User.mocks.dropFirst()) { user in
                            StoryCircle(username: user.username)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                }
                
                // Posts
                LazyVStack(spacing: 24) {
                    ForEach(appState.posts) { post in
                        PostCardView(post: post)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 120)
            }
        }
        .sheet(isPresented: $showMessages) {
            MessagesView()
        }
    }
}

#Preview {
    HomeView()
        .environment(AppState())
        .preferredColorScheme(.dark)
}
