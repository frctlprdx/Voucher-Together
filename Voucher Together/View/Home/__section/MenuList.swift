//
//  MenuPicker.swift
//  Voucher Together
//
//  Created by Ivan Putra Pratama on 22/03/26.
//

import SwiftUI

struct MenuList: View {
    
    @State private var voucherList: [Voucher] = Voucher.dummyVouchers
    var categories: [String]{
        let allCategories = voucherList.map {$0.category}
        return Array(Set(allCategories)).sorted()
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10) {
                Button("All") {
                    //Action
                }.buttonStyle(.bordered)
                ForEach(categories, id: \.self) { category in MenuPicker(categoryName: category)
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    MenuList()
}
