import SwiftUI

struct ProfileSection: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var currentUser: User = User.currentUser.first!
    
    var body: some View {
        NavigationLink(destination: EditProfileView(user: $currentUser).environmentObject(authViewModel)) {
            ProfileCard(user: currentUser)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
