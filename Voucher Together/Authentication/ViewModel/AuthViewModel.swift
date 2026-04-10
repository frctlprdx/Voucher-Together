import Foundation
internal import Combine
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email =  ""
    @Published var password = ""
    @Published var userSession: FirebaseAuth.User?
    @Published var errorMessage: String?
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if let error = error{
                self.errorMessage = error.localizedDescription
                return
            }
            self.userSession = result?.user
        }
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            self.userSession = result?.user
        }
    }
    
    func logout () {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    
}
