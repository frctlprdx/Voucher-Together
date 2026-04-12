import SwiftUI

struct DiscoveryView: View {
    @StateObject private var viewModel = DiscoveryViewModel()
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading Vouchers...") // Loading state
                        .padding(.top, 40)
                } else if viewModel.vouchers.isEmpty {
                    // Tampilan jika Firebase benar-benar kosong
                    EmptyStateView(
                        imageName: "ticket.fill",
                        title: "No Vouchers Available",
                        subtitle: "Check back later for exciting new deals!"
                    )
                } else {
                    MenuList(selectedCategory: $selectedCategory, vouchers: viewModel.vouchers)
                    
                    VoucherList(
                        allVouchers: viewModel.vouchers,
                        selectedCategory: selectedCategory,
                        searchText: searchText
                    )
                }
                Spacer()
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Home")
        }
    }
}
