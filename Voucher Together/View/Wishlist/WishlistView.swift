import SwiftUI

struct WishlistView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack{
            VStack{
                VoucherList()
            }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .navigationTitle("Personal Wishlist")
        }
    }
}
