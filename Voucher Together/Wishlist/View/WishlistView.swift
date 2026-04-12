import SwiftUI

struct WishlistView: View {
    @StateObject private var viewModel = WishlistViewModel()
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.wishlistVouchers.isEmpty {
                    // Pakai EmptyStateView yang kita buat tadi!
                    EmptyStateView(
                        imageName: "heart.slash",
                        title: "No Wishlist Yet",
                        subtitle: "Start exploring and save vouchers you love."
                    )
                } else {
                    // Oper data wishlist ke VoucherList
                    VoucherList(
                        allVouchers: viewModel.wishlistVouchers,
                        selectedCategory: "All",
                        searchText: searchText
                    )
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Personal Wishlist")
        }
    }
}
