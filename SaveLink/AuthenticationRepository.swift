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
}
