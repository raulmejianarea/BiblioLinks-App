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
    
    private let facebookAuthentication = FacebookAuthentication()
    
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
    
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>)->Void) {
        Auth.auth().signIn(withEmail: email, password:  password) { authDataResult, error in
            if let error = error{
                print("Error Login user \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "no email"
            print("User login with info \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    func loginWithFacebook(completionBlock: @escaping (Result<User, Error>) -> Void)  {
        
        facebookAuthentication.loginFacebook { result in
            switch result {
            case .success(let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
                Auth.auth().signIn(with: credential) { authDataResult, error in
                    if let error = error{
                        print("errror creating a new user \(error.localizedDescription)")
                        completionBlock(.failure(error))
                        return
                    }
                    let email = authDataResult?.user.email ?? "no email"
                    print("Ner user created with info \(email)")
                    completionBlock(.success(.init(email: email)))
                
                    
                }
            case .failure(let error):
                print("Error singIn with Facebook \(error.localizedDescription)")
                completionBlock(.failure(error))
            }
        }
    }
    func logOut() throws {
        try Auth.auth().signOut()
    }
}
