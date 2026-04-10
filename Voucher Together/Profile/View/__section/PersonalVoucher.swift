    import SwiftUI

struct PersonalVoucher: View {
    var selectedClassification: String
    @State private var voucherList: [Voucher] = Voucher.dummyVouchers
    @State private var selectedVoucher: Voucher? = nil
    @State var isPresenting = false

    // Logika Filter
    var filteredVouchers: [Voucher] {
        voucherList.filter { $0.classification == selectedClassification }
    }

    var body: some View {
            VStack(spacing: 20) {
                // Gunakan hasil filter
                ForEach(filteredVouchers) { list in
                    VoucherCard(vouchers: list)
                        .onTapGesture {
                            selectedVoucher = list
                            self.isPresenting.toggle()
                        }
                }
            }
            .padding(.vertical)
        .sheet(isPresented: $isPresenting) {
            if let voucher = selectedVoucher {
                VoucherDetail(voucherDetail: voucher)
            }
        }
    }
}
