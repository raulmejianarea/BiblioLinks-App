//
//  LoginEmailView.swift
//  SaveLink
//
//  Created by raul Mejia on 25/8/23.
//

import SwiftUI

struct LoginEmailView: View {
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    @ObservedObject var authenticationViewModel: AuthenticationViewModel

    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 8)
            Group{
                Text("👋🏻 Bienvenido de nuevo a")
                Text("Bibliolinks ")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            Group{
                Text("Logueate de nuevo para poder acceder a todos tus links.")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                TextField("Añade tu correo electronico", text: $textFieldEmail)
                TextField("Añade tu contraseña", text: $textFieldPassword)
                Button("Login"){
                    print("login")
                    authenticationViewModel.login(email: textFieldEmail , password: textFieldPassword)
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError{
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
                
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
            
        }
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
