import SwiftUI

struct CreatePostView: View {
    @Environment(AppState.self) private var appState
    @State private var caption = ""
    @State private var isPosting = false
    @State private var showSuccess = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Nouveau post")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button {
                    post()
                } label: {
                    Text("Partager")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(caption.isEmpty ? .white.opacity(0.3) : Color.inboxPrimary)
                }
                .disabled(caption.isEmpty || isPosting)
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 20)
            
            ScrollView {
                VStack(spacing: 24) {
                    // Image placeholder
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .frame(height: 280)
                        .overlay {
                            VStack(spacing: 12) {
                                Image(systemName: "photo.badge.plus")
                                    .font(.system(size: 40))
                                    .foregroundStyle(.white.opacity(0.4))
                                Text("Ajouter une photo")
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .stroke(.white.opacity(0.15), lineWidth: 1)
                        )
                        .padding(.horizontal, 20)
                    
                    // Caption
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Légende")
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.white.opacity(0.7))
                        
                        TextEditor(text: $caption)
                            .scrollContentBackground(.hidden)
                            .padding(14)
                            .frame(minHeight: 120)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(.white.opacity(0.12), lineWidth: 1)
                            )
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 20)
                    
                    if showSuccess {
                        Text("Post publié ! 🎉")
                            .font(.headline)
                            .foregroundStyle(Color.inboxPrimary)
                            .transition(.scale.combined(with: .opacity))
                    }
                }
                .padding(.bottom, 140)
            }
        }
    }
    
    private func post() {
        isPosting = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            appState.addPost(caption: caption)
            caption = ""
            isPosting = false
            withAnimation {
                showSuccess = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    showSuccess = false
                }
                appState.selectedTab = 0
            }
        }
    }
}

#Preview {
    CreatePostView()
        .environment(AppState())
        .preferredColorScheme(.dark)
}
