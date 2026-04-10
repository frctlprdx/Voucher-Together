import SwiftUI

struct WishlistView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                // KIRIM searchText ke VoucherList di sini
                VoucherList(selectedCategory: "All", searchText: searchText)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Personal Wishlist")
        }
    }
}
