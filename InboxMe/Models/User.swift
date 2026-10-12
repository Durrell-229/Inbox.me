import Foundation

struct User: Identifiable, Hashable {
    let id: String
    var username: String
    var displayName: String
    var avatarURL: String?
    var bio: String
    var postsCount: Int
    var followers: Int
    var following: Int
    var isFollowing: Bool = false
    
    static let mock = User(
        id: "1",
        username: "durrell",
        displayName: "Durrell",
        avatarURL: nil,
        bio: "Building Inbox.me 🚀",
        postsCount: 42,
        followers: 1280,
        following: 312
    )
    
    static let mocks: [User] = [
        mock,
        User(id: "2", username: "luna", displayName: "Luna", avatarURL: nil, bio: "Digital artist", postsCount: 89, followers: 5400, following: 210),
        User(id: "3", username: "kai", displayName: "Kai", avatarURL: nil, bio: "Photographer", postsCount: 156, followers: 8900, following: 430),
        User(id: "4", username: "maya", displayName: "Maya", avatarURL: nil, bio: "Travel ❤️", postsCount: 67, followers: 3200, following: 180),
        User(id: "5", username: "noah", displayName: "Noah", avatarURL: nil, bio: "Music producer", postsCount: 34, followers: 2100, following: 95)
    ]
}
