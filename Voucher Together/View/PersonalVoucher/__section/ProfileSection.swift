import SwiftUI

struct ProfileSection: View {
    @State private var currentUser: [User] = User.currentUser
    var body: some View {
        ProfileCard(user: currentUser.first!)
    }
}

#Preview {
    ProfileSection()
}
