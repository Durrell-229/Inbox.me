import SwiftUI

@Observable
class AppState {
    var isAuthenticated = false
    var currentUser: User = .mock
    var posts: [Post] = Post.mocks
    var selectedTab = 0
    
    // Auth
    func login(email: String, password: String) {
        // Mock login
        isAuthenticated = true
    }
    
    func signUp(username: String, email: String, password: String) {
        // Mock sign up
        currentUser = User(
            id: UUID().uuidString,
            username: username,
            displayName: username.capitalized,
            avatarURL: nil,
            bio: "Nouveau sur Inbox.me 🚀",
            postsCount: 0,
            followers: 0,
            following: 0
        )
        isAuthenticated = true
    }
    
    func logout() {
        isAuthenticated = false
    }
    
    // Posts
    func toggleLike(postId: String) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].isLiked.toggle()
            posts[index].likes += posts[index].isLiked ? 1 : -1
        }
    }
    
    func addPost(caption: String) {
        let newPost = Post(
            id: UUID().uuidString,
            user: currentUser,
            imageURL: nil,
            caption: caption,
            likes: 0,
            comments: 0,
            timestamp: Date(),
            isLiked: false
        )
        posts.insert(newPost, at: 0)
        currentUser.postsCount += 1
    }
}
