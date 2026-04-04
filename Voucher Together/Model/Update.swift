import Foundation

struct Update: Codable, Identifiable{
    let id: Int
    let userId: Int
    let userName: String
    let notifications: String
    let opened: Bool
    let time: Date
}
