import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let hashedPassword: String
    let avatarURL: String?
}
