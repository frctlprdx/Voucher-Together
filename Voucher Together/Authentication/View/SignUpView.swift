import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack() {
            // HEADER
            VStack(spacing: 12) {
                // Ikon yang melambangkan pendaftaran/akun baru
                Image(systemName: "person.badge.plus.fill")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 70))
                    .foregroundColor(.green)
                
                Text("Create Account")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                
                Text("Join Voucher Together and start saving with your friends.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 40)

            // FORM FIELDS
            VStack(spacing: 16) {
                // Input Nama Lengkap
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Full Name", text: $viewModel.fullName)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Input Email
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.secondary)
                    TextField("Email Address", text: $viewModel.email)
                        .textInputAutocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Input Password
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.secondary)
                    SecureField("Password", text: $viewModel.password)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Error Message (Jika ada)
                if let error = viewModel.errorMessage {
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal)

            // ACTION BUTTONS
            VStack(spacing: 16) {
                Button {
                    viewModel.signUp()
                } label: {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                        .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .foregroundColor(.secondary)
                        Text("Login")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    .font(.subheadline)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(24)
//        .overlay(alignment: .topTrailing) {
//            Button {
//                dismiss()
//            } label: {
//                Image(systemName: "xmark.circle.fill")
//                    .font(.title2)
//                    .foregroundColor(.secondary.opacity(0.5))
//            }
//            .padding()
//        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
        Button("OK") {
            dismiss() // Kembali ke halaman Login setelah klik OK
        }
    }
    }
}
