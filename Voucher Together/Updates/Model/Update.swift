import Foundation
import FirebaseFirestore

struct Update: Codable, Identifiable{
    
    @DocumentID var id: String?
    
    let userId: Int
    let userName: String
    let notifications: String
    let opened: Bool
    let time: Date
}
