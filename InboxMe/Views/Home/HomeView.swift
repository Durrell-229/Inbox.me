import SwiftUI

struct HomeView: View {
    @State private var posts = Post.mocks
    
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
                        // Messages
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
                        // Your story
                        StoryCircle(username: "Toi", isAdd: true)
                        
                        ForEach(["luna", "kai", "maya", "noah", "zoe"], id: \.self) { name in
                            StoryCircle(username: name)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                }
                
                // Posts
                LazyVStack(spacing: 24) {
                    ForEach($posts) { $post in
                        PostCardView(post: $post)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 120) // space for tab bar
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
