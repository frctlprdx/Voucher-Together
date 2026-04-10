import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading) {
                TextField("Full Name", text: $viewModel.fullName)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)

            Button {
                viewModel.signUp()
            } label: {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Button("Already have an account? Login") {
                dismiss()
            }
        }
        .padding()
    }
}
