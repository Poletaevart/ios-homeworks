//
//  LogInViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 23.08.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController{
    
    private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
    
    private lazy var textFieldsStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(loginTextField)
            stackView.addArrangedSubview(passwordTextField)
            stackView.distribution = .fillEqually
            stackView.axis = .vertical
            stackView.layer.borderWidth = 0.5
            stackView.backgroundColor = .black
            stackView.setCustomSpacing(0.5, after: loginTextField)
            stackView.layer.borderColor = CGColor(gray: 0.1, alpha: 1)
            stackView.layer.cornerRadius = 10
            stackView.clipsToBounds = true
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
    
    private lazy var loginTextField: UITextField = {
            let textField = UITextField()
            textField.backgroundColor = .systemGray6
            textField.placeholder = "   Email or phone"
            textField.textColor = .black
            textField.font = .systemFont(ofSize: 16, weight: .regular)
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = true
            return textField
        }()
    
    private lazy var passwordTextField: UITextField = {
            let textField = UITextField()
           
            textField.backgroundColor = .systemGray6
            textField.placeholder = "   Password"
            textField.textColor = .black
            textField.textColor = .black
            textField.font = .systemFont(ofSize: 16, weight: .regular)
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = true
            return textField
        }()
    
    private lazy var loginButton: UIButton = {
           let button = UIButton()
           button.backgroundColor = UIColor(named: "ColorBlue")
           button.setTitle("Log In", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 10
           button.clipsToBounds = true
           button.addTarget(Any.self, action: #selector(goToProfile), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.navigationBar.isHidden = true
           
       }

       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           loginTextField.becomeFirstResponder()
       }
       
       @objc func goToProfile() {
           let vc = ProfileViewController()
           
           navigationController?.pushViewController(vc, animated: true)
       }
}

