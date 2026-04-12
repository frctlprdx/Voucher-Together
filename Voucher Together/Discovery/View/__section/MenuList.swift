import SwiftUI

struct MenuList: View {
    @Binding var selectedCategory: String
    var vouchers: [Voucher]

    var categories: [String] {
        let allCategories = vouchers.map { $0.category }
        return Array(Set(allCategories)).sorted()
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                // Tombol All
                CategoryButton(title: "All", isSelected: selectedCategory == "All") {
                    selectedCategory = "All"
                }
                
                // Looping kategori berdasarkan data real dari Firebase
                ForEach(categories, id: \.self) { category in
                    CategoryButton(title: category, isSelected: selectedCategory == category) {
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
