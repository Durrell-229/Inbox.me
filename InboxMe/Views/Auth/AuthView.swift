import SwiftUI

struct AuthView: View {
    @Environment(AppState.self) private var appState
    @State private var isLogin = true
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(red: 0.1, green: 0.05, blue: 0.2),
                    Color(red: 0.04, green: 0.04, blue: 0.08)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Decorative blurs
            Circle()
                .fill(Color.inboxPrimary.opacity(0.3))
                .frame(width: 250, height: 250)
                .blur(radius: 80)
                .offset(x: -100, y: -200)
            
            Circle()
                .fill(Color.inboxSecondary.opacity(0.25))
                .frame(width: 200, height: 200)
                .blur(radius: 70)
                .offset(x: 120, y: 300)
            
            VStack(spacing: 32) {
                Spacer()
                
                // Logo
                VStack(spacing: 12) {
                    Text("Inbox.me")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.inboxPrimary, .inboxSecondary],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text(isLogin ? "Content de te revoir" : "Rejoins la communauté")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                // Form
                if isLogin {
                    LoginForm()
                } else {
                    SignUpForm()
                }
                
                // Switch
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isLogin.toggle()
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text(isLogin ? "Pas encore de compte ?" : "Déjà un compte ?")
                            .foregroundStyle(.white.opacity(0.6))
                        Text(isLogin ? "S'inscrire" : "Se connecter")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.inboxPrimary)
                    }
                    .font(.subheadline)
                }
                
                Spacer()
            }
            .padding(.horizontal, 28)
        }
    }
}

// MARK: - Login Form
struct LoginForm: View {
    @Environment(AppState.self) private var appState
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 16) {
            GlassTextField(placeholder: "Email", text: $email, icon: "envelope")
            GlassTextField(placeholder: "Mot de passe", text: $password, isSecure: true, icon: "lock")
            
            GlassButton(title: "Se connecter", isPrimary: true, isLoading: isLoading) {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    appState.login(email: email, password: password)
                    isLoading = false
                }
            }
            .padding(.top, 8)
        }
    }
}

// MARK: - Sign Up Form
struct SignUpForm: View {
    @Environment(AppState.self) private var appState
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 16) {
            GlassTextField(placeholder: "Nom d'utilisateur", text: $username, icon: "person")
            GlassTextField(placeholder: "Email", text: $email, icon: "envelope")
            GlassTextField(placeholder: "Mot de passe", text: $password, isSecure: true, icon: "lock")
            
            GlassButton(title: "Créer mon compte", isPrimary: true, isLoading: isLoading) {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    appState.signUp(username: username, email: email, password: password)
                    isLoading = false
                }
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    AuthView()
        .environment(AppState())
}
