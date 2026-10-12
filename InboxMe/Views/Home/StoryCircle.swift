import SwiftUI

struct StoryCircle: View {
    let username: String
    var isAdd: Bool = false
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: isAdd ? [.white.opacity(0.3)] : [.inboxPrimary, .inboxSecondary, .inboxAccent],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2.5
                    )
                    .frame(width: 74, height: 74)
                
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 64, height: 64)
                    .overlay {
                        if isAdd {
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundStyle(.white)
                        } else {
                            Text(String(username.prefix(1)).uppercased())
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        }
                    }
            }
            
            Text(username)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.8))
                .lineLimit(1)
        }
    }
}
