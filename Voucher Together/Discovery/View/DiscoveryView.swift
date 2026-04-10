import SwiftUI

struct DiscoveryView: View {
    @State private var searchText: String = ""
    // Tambahkan ini: simpan kategori yang dipilih di sini
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        NavigationStack {
            VStack {
                MenuList(selectedCategory: $selectedCategory)
                VoucherList(selectedCategory: selectedCategory, searchText: searchText)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Home")
        }
    }
}
