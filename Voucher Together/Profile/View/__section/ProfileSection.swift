import SwiftUI

struct ProfileSection: View {
    @State private var currentUser: User = User.currentUser.first!
    
    var body: some View {
        NavigationLink(destination: EditProfileView(user: $currentUser)) {
            ProfileCard(user: currentUser)
        }
        .buttonStyle(PlainButtonStyle()) // Agar warna teks tidak berubah jadi biru (default link)
    }
}
