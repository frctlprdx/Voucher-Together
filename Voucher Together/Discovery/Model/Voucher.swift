import Foundation
import FirebaseFirestore

struct Voucher: Codable, Identifiable, Sendable {
    @DocumentID var id: String? // Gunakan ID dari Firestore
    var imageURL: String?
    var title: String
    var category: String       // Asian, Western, dll.
    var classification: String // "Personal" atau "Shared"
    var ownerId: String        // UID pemilik voucher
    var host: String           // Nama pemilik
    var hostImageURL: String?
    var discount: String
    var minimumPurchase: String
    var description: String
    var countdown: Date
    
    // Properti khusus untuk fitur Sharing
    var maxPeople: Int
    var participantIds: [String] = [] // Daftar UID orang yang sudah Join
    
    // Computed Property untuk memudahkan UI
    var currentPeople: Int {
        return participantIds.count
    }
    
    var isFull: Bool {
        return currentPeople >= maxPeople
    }
}
