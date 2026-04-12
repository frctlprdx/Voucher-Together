import Foundation
import FirebaseFirestore
internal import Combine

class DiscoveryViewModel: ObservableObject {
    @Published var vouchers: [Voucher] = []
    @Published var isLoading: Bool = true
    private var db = Firestore.firestore()
    
    init(){
        fetchVouchers()
    }
    func fetchVouchers() {
            isLoading = true
            db.collection("vouchers").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                    self.isLoading = false
                    return
                }
                
                self.vouchers = documents.compactMap { queryDocumentSnapshot -> Voucher? in
                    return try? queryDocumentSnapshot.data(as: Voucher.self)
                }
                self.isLoading = false
            }
        }
}
