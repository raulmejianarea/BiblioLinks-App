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
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image("Gains")
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
                LoginEmailView()
            case .login:
                RegisterEmailView()
            }
        }
    
        }
    }
  

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
