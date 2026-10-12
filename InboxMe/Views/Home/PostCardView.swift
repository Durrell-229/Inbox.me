import SwiftUI

struct PostCardView: View {
    @Environment(AppState.self) private var appState
    let post: Post
    
    var body: some View {
        GlassCard(cornerRadius: 28) {
            VStack(alignment: .leading, spacing: 0) {
                // Header
                HStack(spacing: 12) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.inboxPrimary, .inboxSecondary],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 40, height: 40)
                        .overlay {
                            Text(String(post.user.username.prefix(1)).uppercased())
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white)
                        }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(post.user.username)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.white)
                        
                        Text(timeAgo(from: post.timestamp))
                            .font(.caption2)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    
                    Spacer()
                    
                    Button {}
                    label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 12)
                
                // Image placeholder
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.inboxPrimary.opacity(0.3),
                                Color.inboxSecondary.opacity(0.25),
                                Color.inboxAccent.opacity(0.2)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 320)
                    .overlay {
                        Image(systemName: "photo")
                            .font(.system(size: 48))
                            .foregroundStyle(.white.opacity(0.3))
                    }
                    .padding(.horizontal, 12)
                
                // Actions
                HStack(spacing: 18) {
                    Button {
                        withAnimation(.spring(response: 0.3)) {
                            appState.toggleLike(postId: post.id)
                        }
                    } label: {
                        Image(systemName: post.isLiked ? "heart.fill" : "heart")
                            .font(.system(size: 22))
                            .foregroundStyle(post.isLiked ? .red : .white)
                            .symbolEffect(.bounce, value: post.isLiked)
                    }
                    
                    Button {}
                    label: {
                        Image(systemName: "bubble.right")
                            .font(.system(size: 21))
                            .foregroundStyle(.white)
                    }
                    
                    Button {}
                    label: {
                        Image(systemName: "paperplane")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Button {}
                    label: {
                        Image(systemName: "bookmark")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 14)
                
                // Likes & Caption
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(post.likes) j'aime")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.white)
                    
                    (Text(post.user.username)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.white)
                     +
                     Text("  \(post.caption)")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.9))
                    )
                    
                    if post.comments > 0 {
                        Text("Voir les \(post.comments) commentaires")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.5))
                            .padding(.top, 2)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
                .padding(.bottom, 16)
            }
        }
    }
    
    private func timeAgo(from date: Date) -> String {
        let seconds = Int(-date.timeIntervalSinceNow)
        if seconds < 60 { return "\u00e0 l'instant" }
        if seconds < 3600 { return "\(seconds / 60) min" }
        if seconds < 86400 { return "\(seconds / 3600) h" }
        return "\(seconds / 86400) j"
    }
}
