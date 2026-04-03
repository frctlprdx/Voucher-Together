//
//  Voucher_TogetherApp.swift
//  Voucher Together
//
//  Created by Ivan Putra Pratama on 22/03/26.
//

import SwiftUI

@main
struct Voucher_TogetherApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Home", systemImage: "house.fill"){
                    HomeView()
                }
                Tab("Wishlist", systemImage: "heart.fill"){
                    WishlistView()
                }
                Tab("Profile", systemImage: "person.crop.circle.fill"){
                    PersonalVoucherView()
                }
                Tab("Updates", systemImage: "bell.fill"){
                    UpdateView()
                }
            }
        }
    }
}
