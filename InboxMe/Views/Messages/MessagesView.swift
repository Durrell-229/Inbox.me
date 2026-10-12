import SwiftUI

struct MessagesView: View {
    @Environment(\.dismiss) private var dismiss
    
    let conversations = [
        ("luna", "Salut ! Le design est trop beau 🔥", "2 min"),
        ("kai", "On se fait un call demain ?", "1 h"),
        ("maya", "Merci pour le follow !", "3 h"),
        ("noah", "Le prochain drop arrive", "1 j"),
        ("zoe", "Haha trop drôle", "2 j")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.06, green: 0.06, blue: 0.1)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(conversations, id: \.0) { conv in
                            HStack(spacing: 14) {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [.inboxPrimary, .inboxSecondary],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 52, height: 52)
                                    .overlay {
                                        Text(String(conv.0.prefix(1)).uppercased())
                                            .font(.title3.weight(.bold))
                                            .foregroundStyle(.white)
                                    }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(conv.0)
                                        .font(.subheadline.weight(.semibold))
                                        .foregroundStyle(.white)
                                    
                                    Text(conv.1)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.55))
                                        .lineLimit(1)
                                }
                                
                                Spacer()
                                
                                Text(conv.2)
                                    .font(.caption2)
                                    .foregroundStyle(.white.opacity(0.4))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                        }
                    }
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.white.opacity(0.6))
                    }
                }
            }
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
        }
        .presentationDetents([.large])
    }
}

#Preview {
    MessagesView()
}
