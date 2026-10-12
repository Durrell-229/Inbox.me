import Foundation

struct Post: Identifiable {
    let id: String
    let user: User
    let imageURL: String?
    let caption: String
    let likes: Int
    let comments: Int
    let timestamp: Date
    var isLiked: Bool = false
    
    static let mocks: [Post] = [
        Post(
            id: "1",
            user: User.mock,
            imageURL: nil,
            caption: "Premier post sur Inbox.me \ud83d\udd25 Le design glass est trop ouf",
            likes: 248,
            comments: 32,
            timestamp: Date().addingTimeInterval(-3600)
        ),
        Post(
            id: "2",
            user: User(
                id: "2",
                username: "luna",
                displayName: "Luna",
                avatarURL: nil,
                bio: "",
                postsCount: 89,
                followers: 5400,
                following: 210
            ),
            imageURL: nil,
            caption: "Sunset vibes \ud83c\udf05",
            likes: 1204,
            comments: 89,
            timestamp: Date().addingTimeInterval(-7200)
        ),
        Post(
            id: "3",
            user: User(
                id: "3",
                username: "kai",
                displayName: "Kai",
                avatarURL: nil,
                bio: "",
                postsCount: 156,
                followers: 8900,
                following: 430
            ),
            imageURL: nil,
            caption: "New drop incoming...",
            likes: 876,
            comments: 54,
            timestamp: Date().addingTimeInterval(-14400)
        )
    ]
}
