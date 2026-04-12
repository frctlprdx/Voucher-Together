import Foundation
import FirebaseFirestore
import FirebaseAuth
internal import Combine

@MainActor
class PersonalVoucherViewModel: ObservableObject {
    @Published var vouchers: [Voucher] = []
    @Published var isLoading: Bool = false
    
    private var db = Firestore.firestore()
    
    // 1. Fungsi untuk mengambil voucher milik user tertentu (untuk Profile)
    func fetchUserVouchers(userId: String) {
        self.isLoading = true
        
        db.collection("vouchers")
            .whereField("ownerId", isEqualTo: userId)
            .addSnapshotListener { [weak self] querySnapshot, error in
                guard let self = self else { return }
                self.isLoading = false
                
                if let error = error {
                    print("DEBUG: Gagal ambil voucher user: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else { return }
                self.vouchers = documents.compactMap { try? $0.data(as: Voucher.self) }
            }
    }
    
    // 2. Fungsi untuk Join ke Sharing Voucher
    func joinVoucher(voucher: Voucher) {
        guard let voucherId = voucher.id,
              let currentUid = Auth.auth().currentUser?.uid else { return }
        
        // Cek apakah sudah penuh atau user sudah join sebelumnya (keamanan client-side)
        if voucher.participantIds.contains(currentUid) || voucher.isFull {
            print("DEBUG: User sudah join atau voucher penuh")
            return
        }
        
        let docRef = db.collection("vouchers").document(voucherId)
        
        // Menggunakan arrayUnion untuk menambah UID ke array di Firestore
        docRef.updateData([
            "participantIds": FieldValue.arrayUnion([currentUid])
        ]) { error in
            if let error = error {
                print("DEBUG: Gagal join voucher: \(error.localizedDescription)")
            } else {
                print("DEBUG: Berhasil join voucher!")
            }
        }
    }
}
