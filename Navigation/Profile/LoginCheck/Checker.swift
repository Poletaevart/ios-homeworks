//
//  Checker.swift
//  Navigation
//
//  Created by Artem Poletaev on 07.11.2022.
//

import UIKit

class Checker {
    static var shared = Checker()
    
    private let loginCheck: String = "www"
    private let passCheck: String = "aa"
    var user: User?

        func check(login: String, pass: String) -> Bool {
            if (login == loginCheck) && (pass == passCheck) {
                 user = User(login: "hipster", fullName: "Hipster Cat", avatarImage: UIImage(named: "IMG_0924")! , status: "Waiting for something" )
                return true
            } else {
                return false
            }
        }
}
