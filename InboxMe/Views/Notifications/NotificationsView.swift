import SwiftUI

struct NotificationsView: View {
    let notifications: [(icon: String, text: String, time: String)] = [
        ("heart.fill", "luna a aimé ton post", "2 min"),
        ("person.badge.plus", "kai a commencé à te suivre", "15 min"),
        ("bubble.right.fill", "maya a commenté : Trop beau !", "1 h"),
        ("heart.fill", "noah et 12 autres ont aimé ton post", "3 h"),
        ("person.badge.plus", "zoe a commencé à te suivre", "5 h"),
        ("bubble.right.fill", "luna a commenté : Fire 🔥", "1 j")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Notifications")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 16)
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(Array(notifications.enumerated()), id: \.offset) { _, notif in
                        HStack(spacing: 14) {
                            Circle()
                                .fill(.ultraThinMaterial)
                                .frame(width: 44, height: 44)
                                .overlay {
                                    Image(systemName: notif.icon)
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color.inboxPrimary)
                                }
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(notif.text)
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                    .lineLimit(2)
                                
                                Text(notif.time)
                                    .font(.caption2)
                                    .foregroundStyle(.white.opacity(0.45))
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                    }
                }
                .padding(.bottom, 120)
            }
        }
    }
}

#Preview {
    NotificationsView()
        .preferredColorScheme(.dark)
}
