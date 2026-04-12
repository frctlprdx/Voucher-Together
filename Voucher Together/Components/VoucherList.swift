import SwiftUI

struct VoucherList: View {
    let allVouchers: [Voucher]
    var selectedCategory: String
    var searchText: String
    
    @State private var selectedVoucher: Voucher? = nil
    @State var isPresenting = false

    var filteredVouchers: [Voucher] {
        allVouchers.filter { voucher in
            let matchCategory = (selectedCategory == "All" || voucher.category == selectedCategory)
            let matchSearch = (searchText.isEmpty || voucher.title.localizedCaseInsensitiveContains(searchText))
            return matchCategory && matchSearch
        }
    }

    var body: some View {
        if filteredVouchers.isEmpty {
            // Tampilan jika hasil filter/search tidak ketemu
            ContentUnavailableView.search(text: searchText)
                .padding(.top, 40)
        } else {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(filteredVouchers) { voucher in
                        VoucherCard(vouchers: voucher)
                            .onTapGesture {
                                selectedVoucher = voucher
                                isPresenting.toggle()
                            }
                    }
                }
                .padding(.vertical)
            }
            .sheet(isPresented: $isPresenting) {
                if let voucher = selectedVoucher {
                    VoucherDetail(voucherDetail: voucher)
                }
            }
        }
    }
}
