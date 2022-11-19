//
//  LoginFactory.swift
//  Navigation
//
//  Created by Artem Poletaev on 07.11.2022.
//

import UIKit

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
