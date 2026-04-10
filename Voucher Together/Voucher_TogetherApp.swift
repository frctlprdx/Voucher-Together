//
//  Voucher_TogetherApp.swift
//  Voucher Together
//
//  Created by Ivan Putra Pratama on 22/03/26.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application (_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Voucher_TogetherApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Home", systemImage: "house.fill"){
                    DiscoveryView()
                }
                Tab("Wishlist", systemImage: "heart.fill"){
                    WishlistView()
                }
                Tab("Profile", systemImage: "person.crop.circle.fill"){
                    if authViewModel.userSession != nil {
                        PersonalVoucherView()
                    } else {
                        LoginView()
                    }
                }
                Tab("Updates", systemImage: "bell.fill"){
                    UpdateView()
                }
            }
        }
    }
}
