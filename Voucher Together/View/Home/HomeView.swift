import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                MenuList()
                VoucherList()
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
