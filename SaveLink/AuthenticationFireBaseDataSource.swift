//
//  AuthenticationFireBaseDataSource.swift
//  SaveLink
//
//  Created by raul Mejia on 25/8/23.
//

import Foundation
import FirebaseAuth

struct User{
    let email: String
}

final class AuthenticationFireBaseDataSource{
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>)-> Void)  {
        Auth.auth().createUser(withEmail: email, password: password) { authdDataResult, error in
            if let error = error{
                print("Error creating a new user \(error.localizedDescription)")
                completionBlock(.failure(error))
            }
            let email = authdDataResult?.user.email ?? "No email"
            print("New user created with info \(email)")
            completionBlock(.success(.init(email: email)))
        }
        
    }
}
