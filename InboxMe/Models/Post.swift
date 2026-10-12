import Foundation

struct Post: Identifiable {
    let id: String
    let user: User
    let imageURL: String?
    var caption: String
    var likes: Int
    var comments: Int
    let timestamp: Date
    var isLiked: Bool = false
    
    static let mocks: [Post] = [
        Post(
            id: "1",
            user: User.mock,
            imageURL: nil,
            caption: "Premier post sur Inbox.me 🔥 Le design glass est trop ouf",
            likes: 248,
            comments: 32,
            timestamp: Date().addingTimeInterval(-3600)
        ),
        Post(
            id: "2",
            user: User.mocks[1],
            imageURL: nil,
            caption: "Sunset vibes 🌅",
            likes: 1204,
            comments: 89,
            timestamp: Date().addingTimeInterval(-7200)
        ),
        Post(
            id: "3",
            user: User.mocks[2],
            imageURL: nil,
            caption: "New drop incoming...",
            likes: 876,
            comments: 54,
            timestamp: Date().addingTimeInterval(-14400)
        ),
        Post(
            id: "4",
            user: User.mocks[3],
            imageURL: nil,
            caption: "Weekend getaway ✈️",
            likes: 543,
            comments: 27,
            timestamp: Date().addingTimeInterval(-28800)
        )
    ]
}
