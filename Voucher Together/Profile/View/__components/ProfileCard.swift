import SwiftUI

struct ProfileCard: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 16) { // Memberi jarak antar elemen secara horizontal
            // MARK: - Avatar Section
            AsyncImage(url: URL(string: user.avatarURL ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure(_), .empty:
                    // Placeholder jika gambar gagal atau kosong
                    ZStack {
                        Color.blue.opacity(0.1)
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 24))
                    }
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 60, height: 60) // Ukuran tetap agar konsisten
            .clipShape(Circle()) // Bentuk lingkaran lebih modern untuk profile
            .overlay(Circle().stroke(Color.gray.opacity(0.1), lineWidth: 1))
            
            // MARK: - Info Section
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer() // Mendorong konten ke kiri
            
            // MARK: - Action Button (Opsional)
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground)) // Adaptif terhadap Dark Mode
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}

#Preview {
    ProfileCard(user: User.currentUser[0])
}

