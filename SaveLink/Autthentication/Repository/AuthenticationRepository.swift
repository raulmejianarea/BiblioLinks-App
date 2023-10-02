//
//  AuthenticationRepository.swift
//  SaveLink
//
//  Created by raul Mejia on 25/8/23.
//

import Foundation


final class AuthenticationRepository{
    private let authenticationFireBaseDataSource: AuthenticationFireBaseDataSource
    
    init(authenticationFireBaseDataSource: AuthenticationFireBaseDataSource = AuthenticationFireBaseDataSource()) {
        self.authenticationFireBaseDataSource = authenticationFireBaseDataSource
    }
    func getCurrentUser()-> User? {
        authenticationFireBaseDataSource.getCurrentUser()
    }
    func createnewUser(email: String, password: String, completionBlock: @escaping(Result<User, Error>)-> Void) {
        authenticationFireBaseDataSource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    func login(email: String, password: String, completionBlock: @escaping(Result<User, Error>)-> Void) {
        authenticationFireBaseDataSource.login(email: email, password: password, completionBlock: completionBlock)
    }
    func loginWithFacebook( completionBlock: @escaping(Result<User, Error>)-> Void) {
        authenticationFireBaseDataSource.loginWithFacebook(completionBlock: completionBlock)
    }
    
    func logOut() throws{
      try  authenticationFireBaseDataSource.logOut()
    }
}
