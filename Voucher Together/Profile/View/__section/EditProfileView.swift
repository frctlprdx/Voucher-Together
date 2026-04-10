import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Binding var user: User
    @State private var selectedItem: PhotosPickerItem? = nil
    
    var body: some View {
        Form {
            Section(header: Text("Foto Profil")) {
                HStack {
                    Spacer()
                    VStack {
                        // Tampilan Avatar saat ini
                        AsyncImage(url: URL(string: user.avatarURL ?? "")) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        
                        // Tombol masuk ke Galeri
                        PhotosPicker(selection: $selectedItem, matching: .images) {
                            Text("Ganti Foto")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
            
            Section(header: Text("Informasi Pribadi")) {
                TextField("Nama", text: Binding(
                    get: { user.name },
                    set: { user = User(id: user.id, name: $0, email: user.email, avatarURL: user.avatarURL) }
                ))
                
                TextField("Email", text: Binding(
                    get: { user.email },
                    set: { user = User(id: user.id, name: user.name, email: $0, avatarURL: user.avatarURL) }
                ))
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            }
        }
        .navigationTitle("Edit Profil")
        .navigationBarTitleDisplayMode(.inline)
    }
}
