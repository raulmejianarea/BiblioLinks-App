//
//  HomeView.swift
//  SaveLink
//
//  Created by raul Mejia on 27/8/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Bienvendio a \(authenticationViewModel.user?.email ?? "No user ")")
                    .padding(.top, 32)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar {
                Button("LogOut"){
                    authenticationViewModel.logOut()
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(authenticationViewModel: AuthenticationViewModel())
    }
}
