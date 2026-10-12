import SwiftUI

struct ProfileView: View {
    @Environment(AppState.self) private var appState
    @State private var showEditProfile = false
    @State private var showSettings = false
    
    var user: User {
        appState.currentUser
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                // Header
                HStack {
                    Text(user.username)
                        .font(.title2.weight(.bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                
                // Profile info
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .stroke(
                                LinearGradient(
                                    colors: [.inboxPrimary, .inboxSecondary, .inboxAccent],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 3
                            )
                            .frame(width: 100, height: 100)
                        
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 88, height: 88)
                            .overlay {
                                Text(String(user.displayName.prefix(1)))
                                    .font(.system(size: 36, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                    }
                    
                    Text(user.displayName)
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(.white)
                    
                    Text(user.bio)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    // Stats
                    HStack(spacing: 0) {
                        StatItem(value: "\(user.postsCount)", label: "Posts")
                        StatItem(value: formatNumber(user.followers), label: "Followers")
                        StatItem(value: formatNumber(user.following), label: "Following")
                    }
                    .padding(.top, 8)
                    
                    // Buttons
                    HStack(spacing: 12) {
                        GlassButton(title: "Modifier le profil", icon: "pencil") {
                            showEditProfile = true
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                }
                
                // Grid
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 2),
                    GridItem(.flexible(), spacing: 2),
                    GridItem(.flexible(), spacing: 2)
                ], spacing: 2) {
                    ForEach(0..<9, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.inboxPrimary.opacity(0.25 + Double(i % 3) * 0.1),
                                        Color.inboxSecondary.opacity(0.2)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .aspectRatio(1, contentMode: .fit)
                            .overlay {
                                Image(systemName: "photo")
                                    .foregroundStyle(.white.opacity(0.2))
                            }
                    }
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 120)
            }
        }
        .sheet(isPresented: $showEditProfile) {
            EditProfileView()
        }
        .confirmationDialog("Paramètres", isPresented: $showSettings) {
            Button("Se déconnecter", role: .destructive) {
                appState.logout()
            }
            Button("Annuler", role: .cancel) {}
        }
    }
    
    private func formatNumber(_ number: Int) -> String {
        if number >= 1000 {
            return String(format: "%.1fK", Double(number) / 1000)
        }
        return "\(number)"
    }
}

struct StatItem: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.headline.weight(.bold))
                .foregroundStyle(.white)
            Text(label)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
        .preferredColorScheme(.dark)
}
