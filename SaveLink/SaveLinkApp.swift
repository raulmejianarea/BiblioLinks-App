//
//  SaveLinkApp.swift
//  SaveLink
//
//  Created by raul Mejia on 24/8/23.
//

import SwiftUI
import Firebase
import FacebookLogin

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        FirebaseApp.configure()
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
        
    }
}

@main
struct SaveLinkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user{
                HomeView(authenticationViewModel: authenticationViewModel)
            }else{
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}
