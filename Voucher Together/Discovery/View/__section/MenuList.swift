//
//  MenuPicker.swift
//  Voucher Together
//
//  Created by Ivan Putra Pratama on 22/03/26.
//

import SwiftUI

struct MenuList: View {
    @Binding var selectedCategory: String
    @State private var voucherList: [Voucher] = Voucher.dummyVouchers
    
    var categories: [String] {
        let allCategories = voucherList.map { $0.category }
        return Array(Set(allCategories)).sorted()
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                // Tombol All
                CategoryButton(title: "All", isSelected: selectedCategory == "All") {
                    selectedCategory = "All"
                }
                
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
