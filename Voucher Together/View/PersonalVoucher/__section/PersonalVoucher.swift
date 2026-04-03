    import SwiftUI

    struct PersonalVoucher: View {
        @State private var voucherList: [Voucher] = Voucher.dummyVouchers
        @State private var selectedVoucher: Voucher? = nil
        @State var isPresenting = false

        var body: some View {
            ScrollView (showsIndicators: false){
                VStack(spacing: 20) {
                    ForEach(voucherList) { list in
                        VoucherCard(vouchers: list)
                            .onTapGesture {
                                self.isPresenting.toggle()
                                selectedVoucher = list
                            }
                    }
                }
                .padding(.vertical)
            }.sheet(isPresented: $isPresenting) {
                if let voucher = selectedVoucher {
                    VoucherDetail(voucherDetail: voucher)
                }
            }
        }
    }
