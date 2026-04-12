import Foundation
import FirebaseFirestore
internal import Combine

@MainActor
class UpdateViewModel: ObservableObject {
    @Published var updates: [Update] = []
    @Published var isLoading: Bool = false // TAMBAHKAN BARIS INI
    
    private var db = Firestore.firestore()
    
    func fetchUpdates() {
        self.isLoading = true // Set true saat mulai ambil data
        
        db.collection("updates")
            .order(by: "time", descending: true)
            .addSnapshotListener { [weak self] querySnapshot, error in
                guard let self = self else { return }
                
                // Gunakan DispatchQueue agar loading berhenti di thread utama
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    if let error = error {
                        print("DEBUG: Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let documents = querySnapshot?.documents else { return }
                    self.updates = documents.compactMap { try? $0.data(as: Update.self) }
                }
            }
    }
}
