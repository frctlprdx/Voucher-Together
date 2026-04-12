import Foundation
import FirebaseFirestore
internal import Combine

class WishlistViewModel: ObservableObject {
    @Published var wishlistVouchers: [Voucher] = []
    @Published var isLoading = true
    private var db = Firestore.firestore()
    
    init() {
        fetchWishlist()
    }
    
    func fetchWishlist() {
        db.collection("vouchers")
            .whereField("isWishlist", isEqualTo: true)
            .addSnapshotListener { querySnapshot, _ in
                guard let documents = querySnapshot?.documents else {
                    self.isLoading = false
                    return
                }
                self.wishlistVouchers = documents.compactMap { try? $0.data(as: Voucher.self) }
                self.isLoading = false
            }
    }
}
