import SwiftUI

struct ProfileSection: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationLink(destination: EditProfileView(user: .constant(user)).environmentObject(authViewModel)) {
                ProfileCard(user: user)
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            ProgressView()
        }
    }
}
