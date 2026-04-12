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
                Tab("Home", systemImage: "house.fill") {
                    DiscoveryView()
                }

                Tab("Wishlist", systemImage: "heart.fill") {
                    if authViewModel.userSession != nil {
                        WishlistView()
                    } else {
                        UnauthenticatedView(
                            title: "Your Wishlist is Waiting",
                            subtitle: "Save your favorite vouchers so you don't miss out on great deals.",
                            imageName: "heart.circle.fill"
                        )
                    }
                }

                Tab("Profile", systemImage: "person.crop.circle.fill") {
                    if authViewModel.userSession != nil {
                        PersonalVoucherView().environmentObject(authViewModel)
                    } else {
                        UnauthenticatedView(
                            title: "Profile",
                            subtitle: "Sign in to manage your account and see your activity.",
                            imageName: "person.circle.fill"
                        )
                    }
                }
                
                Tab("Updates", systemImage: "bell.fill") {
                    if authViewModel.userSession != nil {
                        UpdateView()
                    } else {
                        UnauthenticatedView(
                            title: "Stay Notified",
                            subtitle: "Get the latest updates about your shared vouchers.",
                            imageName: "bell.circle.fill"
                        )
                    }
                }
            }.environmentObject(authViewModel)
        }
    }
}
