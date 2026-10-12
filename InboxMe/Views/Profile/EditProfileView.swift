import SwiftUI

struct EditProfileView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.dismiss) private var dismiss
    
    @State private var displayName = ""
    @State private var username = ""
    @State private var bio = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.06, green: 0.06, blue: 0.1)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Avatar
                        ZStack {
                            Circle()
                                .fill(.ultraThinMaterial)
                                .frame(width: 100, height: 100)
                                .overlay {
                                    Text(String((displayName.isEmpty ? "A" : displayName).prefix(1)))
                                        .font(.system(size: 36, weight: .bold, design: .rounded))
                                        .foregroundStyle(.white)
                                }
                            
                            Circle()
                                .fill(Color.inboxPrimary)
                                .frame(width: 32, height: 32)
                                .overlay {
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.white)
                                }
                                .offset(x: 34, y: 34)
                        }
                        .padding(.top, 20)
                        
                        VStack(spacing: 16) {
                            field(title: "Nom", text: $displayName)
                            field(title: "Nom d'utilisateur", text: $username)
                            field(title: "Bio", text: $bio, isMultiline: true)
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Modifier le profil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Annuler") { dismiss() }
                        .foregroundStyle(.white.opacity(0.7))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Enregistrer") {
                        appState.currentUser.displayName = displayName
                        appState.currentUser.username = username
                        appState.currentUser.bio = bio
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.inboxPrimary)
                }
            }
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .onAppear {
                displayName = appState.currentUser.displayName
                username = appState.currentUser.username
                bio = appState.currentUser.bio
            }
        }
    }
    
    @ViewBuilder
    private func field(title: String, text: Binding<String>, isMultiline: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.5))
            
            if isMultiline {
                TextEditor(text: text)
                    .scrollContentBackground(.hidden)
                    .frame(minHeight: 80)
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(.white.opacity(0.12), lineWidth: 1)
                    )
                    .foregroundStyle(.white)
            } else {
                TextField("", text: text)
                    .padding(14)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(.white.opacity(0.12), lineWidth: 1)
                    )
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    EditProfileView()
        .environment(AppState())
}
