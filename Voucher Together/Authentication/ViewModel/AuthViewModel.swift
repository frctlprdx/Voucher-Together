import Foundation
internal import Combine
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var fullName = ""
    @Published var email =  ""
    @Published var password = ""
    @Published var userSession: FirebaseAuth.User?
    @Published var errorMessage: String?
    @Published var isRegistrationSuccess = false
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    private var db = Firestore.firestore()
    
    init(){
        self.userSession = Auth.auth().currentUser
        if userSession != nil { fetchUser() }
    }
    
    @MainActor
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        db.collection("users").document(uid).getDocument { snapshot, error in
            // Gunakan Task untuk kembali ke MainActor secara eksplisit
            Task { @MainActor in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                // Sekarang aman memanggil User.self karena kita sudah di MainActor
                guard let user = try? snapshot?.data(as: User.self) else {
                    print("DEBUG: Gagal decode data")
                    return
                }
                
                self.currentUser = user
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                DispatchQueue.main.async { self.errorMessage = error.localizedDescription }
                return
            }
            DispatchQueue.main.async {
                self.userSession = result?.user
                self.fetchUser()
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                DispatchQueue.main.async { self.errorMessage = error.localizedDescription }
                return
            }
            
            guard let uid = result?.user.uid else { return }
            self.saveUserData(uid: uid)
            
            DispatchQueue.main.async {
                self.alertMessage = "Account created successfully! Please sign in."
                self.showAlert = true
                // Kita tidak langsung login-kan user agar dia melewati proses LoginView secara resmi
            }
        }
    }
    
    func saveUserData(uid: String) {
        let userData: [String: Any] = ["id": uid, "name": fullName, "email": email, "avatarURL": ""]
        db.collection("users").document(uid).setData(userData)
    }
    
    func logout () {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    
}
