import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let username: String
    let displayName: String
    let avatarURL: String?
    let bio: String
    let postsCount: Int
    let followers: Int
    let following: Int
    
    static let mock = User(
        id: "1",
        username: "durrell",
        displayName: "Durrell",
        avatarURL: nil,
        bio: "Building Inbox.me \ud83d\ude80",
        postsCount: 42,
        followers: 1280,
        following: 312
    )
}
