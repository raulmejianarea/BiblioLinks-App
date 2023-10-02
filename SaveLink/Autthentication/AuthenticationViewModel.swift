//
//  AuthenticationViewModel.swift
//  SaveLink
//
//  Created by raul Mejia on 25/8/23.
//

import Foundation

final class AuthenticationViewModel: ObservableObject{
    @Published var user: User?
    @Published var messageError: String?
    
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository()) {
        self.authenticationRepository = authenticationRepository
        getCurrentUser()
    }
    func getCurrentUser() {
        self.user = authenticationRepository.getCurrentUser()
    }
    func createNewUser(email: String, password: String) {
        authenticationRepository.createnewUser(email: email, password: password) { [weak self] result in
            switch result{
            case .success(let user):
                //
                self?.user = user
            case .failure(let error):
                //
                self?.messageError = error.localizedDescription
            }
        }
    }
    func logOut()  {
        do{
            try authenticationRepository.logOut()
            self.user = nil
        }catch{
            print("error logout")
        }
    }
    func login(email: String, password: String) {
        authenticationRepository.login(email: email, password: password) { [weak self] result in
            switch result{
            case .success(let user):
                //
                self?.user = user
            case .failure(let error):
                //
                self?.messageError = error.localizedDescription
            }
        }
    }
    func loginWithFacebook() {
        authenticationRepository.loginWithFacebook() { [weak self] result in
            switch result{
            case .success(let user):
                //
                self?.user = user
            case .failure(let error):
                //
                self?.messageError = error.localizedDescription
            }
        }
    }
}
