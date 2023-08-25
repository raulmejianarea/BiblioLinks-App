//
//  RegisterEmailView.swift
//  SaveLink
//
//  Created by raul Mejia on 25/8/23.
//

import SwiftUI

struct RegisterEmailView: View {
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 8)
            Group{
                Text("💪🏻Bienvenido a")
                Text("Cross Gym ")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            Group{
                Text("Registrate para guardas todos tus links.")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                TextField("Añade tu correo electronico", text: $textFieldEmail)
                TextField("Añade tu contraseña", text: $textFieldPassword)
                Button("Aceptar"){
                    print("Aceptar")
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
            
        }
    }
}

struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView()
    }
}
