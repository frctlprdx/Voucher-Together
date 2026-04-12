import SwiftUI
import FirebaseAuth

struct PersonalVoucher: View {
    var selectedClassification: String
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var personalVM = PersonalVoucherViewModel()
    
    @State private var selectedVoucher: Voucher? = nil
    @State var isPresenting = false

    var filteredVouchers: [Voucher] {
        personalVM.vouchers.filter { $0.classification == selectedClassification }
    }

    var body: some View {
        VStack(spacing: 20) {
            if personalVM.isLoading {
                ProgressView()
            } else if filteredVouchers.isEmpty {
                // Tampilan jika data kosong sesuai permintaan Anda
                VStack(spacing: 10) {
                    Spacer(minLength: 40)
                    Image(systemName: "ticket.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("No \(selectedClassification) found")
                        .font(.headline)
                    Text("Try adding a new voucher or check other categories.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
            } else {
                ForEach(filteredVouchers) { voucher in
                    VoucherCard(vouchers: voucher)
                        .onTapGesture {
                            selectedVoucher = voucher
                            self.isPresenting.toggle()
                        }
                }
            }
        }
        .onAppear {
            if let uid = authViewModel.userSession?.uid {
                personalVM.fetchUserVouchers(userId: uid)
            }
        }
        .sheet(isPresented: $isPresenting) {
            if let voucher = selectedVoucher {
                VoucherDetail(voucherDetail: voucher)
                    .environmentObject(personalVM) // Kirim VM ke Detail agar bisa klik Join
            }
        }
    }
}
