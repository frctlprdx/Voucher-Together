import SwiftUI

struct UnauthenticatedView: View {
    let title: String
    let subtitle: String
    let imageName: String
    @State private var showLogin = false
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: imageName)
                .font(.system(size: 80))
                .foregroundStyle(.blue.gradient)
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.title2.bold())
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            Button {
                showLogin.toggle()
            } label: {
                Text("Sign In / Register")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .fullScreenCover(isPresented: $showLogin) {
            LoginView().environmentObject(authViewModel)
        }
    }
}
