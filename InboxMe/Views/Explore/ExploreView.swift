import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Search bar
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.white.opacity(0.5))
                
                TextField("Rechercher", text: $searchText)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(.white.opacity(0.12), lineWidth: 1)
            )
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 16)
            
            ScrollView(showsIndicators: false) {
                // Suggested users
                VStack(alignment: .leading, spacing: 12) {
                    Text("Suggestions")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(User.mocks.dropFirst()) { user in
                                SuggestedUserCard(user: user)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 20)
                
                // Grid
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(0..<18, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.inboxPrimary.opacity(0.2 + Double(i % 5) * 0.08),
                                        Color.inboxSecondary.opacity(0.15 + Double(i % 3) * 0.1)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .aspectRatio(1, contentMode: .fit)
                            .overlay {
                                Image(systemName: "photo")
                                    .font(.title3)
                                    .foregroundStyle(.white.opacity(0.2))
                            }
                    }
                }
                .padding(.bottom, 120)
            }
        }
    }
}

struct SuggestedUserCard: View {
    let user: User
    @State private var isFollowing = false
    
    var body: some View {
        GlassCard(cornerRadius: 20) {
            VStack(spacing: 10) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.inboxPrimary, .inboxSecondary],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 56, height: 56)
                    .overlay {
                        Text(String(user.username.prefix(1)).uppercased())
                            .font(.title3.weight(.bold))
                            .foregroundStyle(.white)
                    }
                
                Text(user.username)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white)
                
                Text("\(user.followers) followers")
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.5))
                
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        isFollowing.toggle()
                    }
                } label: {
                    Text(isFollowing ? "Suivi" : "Suivre")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(isFollowing ? .white.opacity(0.7) : .white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(isFollowing ? Color.white.opacity(0.1) : Color.inboxPrimary)
                        .clipShape(Capsule())
                }
            }
            .padding(12)
            .frame(width: 130)
        }
    }
}

#Preview {
    ExploreView()
        .preferredColorScheme(.dark)
}
