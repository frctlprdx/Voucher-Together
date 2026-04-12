import Foundation

struct User: Identifiable, Codable, Sendable {
    let id: String
    var name: String
    var email: String
    var avatarURL: String?
}
