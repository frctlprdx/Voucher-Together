import SwiftUI

struct VoucherCard: View {
    let vouchers: Voucher

    var body: some View {
        VStack(alignment: .leading, spacing: 8) { // Spacing dikurangi agar lebih compact
            
            // 1. Image Section (Dioptimalkan Tingginya)
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: vouchers.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle().fill(Color(.systemGray5))
                }
                .frame(height: 150) // Tinggi dikurangi dari 180 ke 150 agar tidak terlalu besar
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                
                // 2. Favorite Button (Tetap HIG 44x44)
                Button {
                    // action
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
                .padding(6)
            }

            // 3. Info Section
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .firstTextBaseline) {
                    Text(vouchers.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .lineLimit(1) // Mencegah teks terlalu panjang merusak layout
                    
                    Spacer()
                    
                    // Host Info
                    HStack(spacing: 4) {
                        AsyncImage(url: URL(string: vouchers.hostImageURL ?? "")) { image in
                            image.resizable()
                        } placeholder: {
                            Circle().fill(Color(.systemGray4))
                        }
                        .frame(width: 16, height: 16)
                        .clipShape(Circle())
                        
                        Text(vouchers.host)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                HStack {
                    Text(vouchers.minimumPurchase)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    // Memastikan CountdownTimerView memiliki data yang benar
                    Text("01:59:00") // Placeholder jika view kustom Anda belum siap
                        .font(.caption.monospacedDigit())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.red.opacity(0.1))
                        .foregroundStyle(.red)
                        .clipShape(Capsule())
                }

                // 4. Progress Section
                VStack(spacing: 4) {
                    ProgressView(value: Double(vouchers.currentPeople), total: Double(vouchers.maxPeople))
                        .tint(.blue)
                    
                    HStack {
                        Spacer()
                        Text("\(vouchers.currentPeople)/\(vouchers.maxPeople) People")
                            .font(.system(size: 10, weight: .medium, design: .monospaced))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.horizontal, 2)
        }
        .padding(12) // Padding internal lebih ramping
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4)
        .padding(.horizontal) // Margin luar kartu terhadap layar
    }
}


