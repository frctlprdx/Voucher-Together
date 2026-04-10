import Foundation

struct Voucher:Codable, Identifiable{
    var id = UUID()
    var imageURL: String?
    var title: String
    var category: String
    var classification: String
    var ownerId: Int
    var host: String
    var hostImageURL: String?
    var discount: String
    var minimumPurchase: String
    var currentPeople: Int
    var maxPeople: Int
    var description: String
    var countdown: Date
}
