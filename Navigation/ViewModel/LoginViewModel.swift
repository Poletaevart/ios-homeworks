//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Artem Poletaev on 06.04.2023.
//

import Foundation

class LoginViewModel {
    static var loginFactoryDelegate: LoginFactory?
    
    let coordinator: ProfileCoordinator?
    
    var loginFactory: LoginFactory
    var loginedUser: User? {
        didSet {
            self.checkerIsLaunched?(self)
        }
    }
    enum LoginError: Error {
        case emptyFields
        case invalidCredentials
    }

    var checkerIsLaunched: ((LoginViewModel) -> ())?
    
    init(model: LoginFactory) {
        self.loginFactory = model
    }
    
//    func startChecker(login: String, pass: String) {
//        if loginFactory.makeLoginInspector().check(login: login, pass: pass) {
//            loginedUser = Checker.shared.user
//        } else {
//            loginedUser = nil
//        }
//    }
    
    func buttonTapped(login: String, pass: String) throws {
        guard !login.isEmpty, !pass.isEmpty else {
            throw LoginError.emptyFields
        }

        if loginFactory.makeLoginInspector().check(login: login, pass: pass) {
            let user = Checker.shared.user
            coordinator?.toProfileViewController(with: loginedUser )
        } else {
            throw LoginError.invalidCredentials
        }
    }

}
