//
//  ContentView.swift
//  SaveLink
//
//  Created by raul Mejia on 24/8/23.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable{
    case register
    case login
    
    var id: String{
        return rawValue
    }
    
}


struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image("Bibliolinks")
                .resizable()
                .frame(width: 200, height: 200)
            VStack{
                Button{
                    print("Login")
                    authenticationSheetView = .login
                }label: {
                    Label("Entra con email",systemImage: "envelope.fill")
                }
                .tint(.black)
                Button{
                    print("Login with Facebook")
                    authenticationViewModel.loginWithFacebook()
                }label: {
                    Image("facebook")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Entra con Facebook")
                        
                }
                .tint(.blue)
                
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .padding(.top, 60)
            Spacer()
            HStack{
                Button {
                    print("registro")
                    authenticationSheetView = .register
                }label: {
                    Text("¿No tienes cuenta?")
                    Text("Registrate")
                        .underline()
                }
                .tint(.black)
            }
          }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .register:
                RegisterEmailView(authenticationViewModel: authenticationViewModel)
            case .login:
                LoginEmailView(authenticationViewModel: authenticationViewModel)
            }
        }
    
        }
    }
  

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authenticationViewModel: AuthenticationViewModel())
    }
}
