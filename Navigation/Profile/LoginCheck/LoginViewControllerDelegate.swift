//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Artem Poletaev on 07.11.2022.
//

import UIKit

import Foundation

protocol LoginViewControllerDelegate {
    func check(login: String, pass: String) -> Bool
}
