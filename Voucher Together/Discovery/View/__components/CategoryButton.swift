import SwiftUI

struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline) // Menjaga konsistensi tipografi
                .fontWeight(.medium)
                .padding(.horizontal, 20) // Sedikit diperlebar agar lebih nyaman
                .frame(minHeight: 44) // MEMASTIKAN tinggi minimal sesuai HIG
                .background(isSelected ? Color.blue : Color(.systemGray6))
                .foregroundColor(isSelected ? .white : .primary)
                // Menggunakan continuous corner radius agar lebih halus khas Apple
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        }
        // Menambahkan contentShape agar seluruh area background bisa diklik
        .contentShape(Rectangle())
        // Menghilangkan scaling bawaan yang kadang memperkecil area klik saat ditekan
        .buttonStyle(PlainButtonStyle())
    }
}
