//
//  LoginInspector.swift
//  Navigation
//
//  Created by Artem Poletaev on 07.11.2022.
//

import UIKit

struct LoginInspector: LoginViewControllerDelegate{
    func check(login: String, pass: String) -> Bool {
        return Checker.shared.check(login: login, pass: pass)
    }
}
