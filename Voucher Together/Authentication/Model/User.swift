import Foundation

struct User: Identifiable, Codable {
    let id: Int
    var name: String
    var email: String
    var avatarURL: String?
}
