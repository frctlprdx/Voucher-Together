import SwiftUI

struct VoucherList: View {
    var selectedCategory: String = "All" 
    var searchText: String = ""
    @State private var voucherList: [Voucher] = Voucher.dummyVouchers
    @State private var selectedVoucher: Voucher? = nil
    @State var isPresenting = false

    // Logika Filter Data
    var filteredVouchers: [Voucher] {
        voucherList.filter { voucher in
            let matchCategory = (selectedCategory == "All" || voucher.category == selectedCategory)
            let matchSearch = (searchText.isEmpty || voucher.title.localizedCaseInsensitiveContains(searchText))
            return matchCategory && matchSearch
        }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // Pastikan menggunakan filteredVouchers
                ForEach(filteredVouchers) { list in
                    VoucherCard(vouchers: list)
                        .onTapGesture {
                            selectedVoucher = list
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
