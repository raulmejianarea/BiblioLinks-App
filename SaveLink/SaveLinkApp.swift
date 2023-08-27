//
//  SaveLinkApp.swift
//  SaveLink
//
//  Created by raul Mejia on 24/8/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        FirebaseApp.configure()
        
        return true
        
    }
}

@main
struct SaveLinkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let user = authenticationViewModel.user{
                Text("User Logged: \(user.email)")
            }else{
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}
