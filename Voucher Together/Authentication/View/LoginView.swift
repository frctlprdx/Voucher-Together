import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss // <--- Tambahkan ini
    @StateObject private var viewModel = AuthViewModel()
    @State private var showSignUp = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                
                // HEADER
                VStack(spacing: 12) {
                    Image(systemName: "lock.shield.fill") // Gunakan varian .fill agar lebih solid
                        .symbolRenderingMode(.hierarchical)
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                    
                    Text("Welcome Back")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                    
                    Text("Sign in to manage your vouchers together.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 40)
                
                // FORM FIELDS
                VStack(spacing: 16) {
                    // Custom Style untuk Email
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
                    
                    // Custom Style untuk Password
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.secondary)
                        SecureField("Password", text: $viewModel.password)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Error Message
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                // ACTION BUTTONS
                VStack(spacing: 16) {
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    
                    Button {
                        showSignUp.toggle()
                    } label: {
                        HStack(spacing: 4) {
                            Text("Don't have an account?")
                                .foregroundColor(.secondary)
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                        .font(.subheadline)
                    }
                }
                
                Spacer()
            }
            .padding(24)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss() // Menutup LoginView dan kembali ke TabView
                    } label: {
                        Image(systemName: "xmark") // Icon silang lebih modern
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                }
            }
            .sheet(isPresented: $showSignUp) {
                SignUpView()
                    .environmentObject(viewModel)
//                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}
