import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    // Gunakan state lokal agar perubahan tidak langsung permanen
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    
    // Binding dari parent view (misalnya dari ProfileView)
    @Binding var user: User

    var body: some View {
        Form {
            // MARK: - Foto Profil
            Section {
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        AsyncImage(url: URL(string: user.avatarURL ?? "")) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundColor(.secondary)
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        
                        PhotosPicker(selection: $selectedItem, matching: .images) {
                            Text("Ganti Foto")
                                .font(.footnote.bold())
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, 10)
            } header: {
                Text("Foto Profil")
            }
            
            // MARK: - Informasi Pribadi
            Section {
                HStack {
                    Text("Nama")
                        .frame(width: 80, alignment: .leading)
                    TextField("Masukkan nama", text: $name)
                }
                
                HStack {
                    Text("Email")
                        .frame(width: 80, alignment: .leading)
                    TextField("Masukkan email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disabled(true) // Biasanya email di Firebase tidak boleh diedit sembarangan
                }
            } header: {
                Text("Informasi Pribadi")
            }
            
            // MARK: - Aksi
            Section {
                Button(role: .destructive) {
                    authViewModel.logout()
                } label: {
                    HStack {
                        Spacer()
                        Text("Log Out")
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Edit Profil")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Load data awal ke state lokal
            self.name = user.name
            self.email = user.email
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Simpan") {
                    updateProfile()
                }
                .bold()
            }
        }
    }
    
    func updateProfile() {
        // Update data user yang ada di binding
        user.name = name
        // Di sini nantinya kamu panggil fungsi Firestore untuk save data
        dismiss()
    }
}
