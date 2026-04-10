import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    @State private var showSignUp = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.shield")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                    
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                    
            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red).font(.caption)
            }
                    
            Button {
                viewModel.login()
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
                    
            Button("Don't have an account? Sign Up") {
                showSignUp.toggle()
            }
        }
        .sheet(isPresented: $showSignUp) {
            SignUpView().environmentObject(viewModel)
        }
    }
}
