//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 20.07.2022.
//

import UIKit

class ProfileViewController:UIViewController{
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        self.view.backgroundColor = .lightGray
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    private lazy var newTitleButton: UIButton = {
            let button = UIButton()
            button.setTitle("New title", for: .normal)
            button.setTitleColor(.white , for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            button.layer.shadowOpacity = 0.7
            button.layer.shadowRadius = 4
            button.layer.cornerRadius = 4
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile"
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newTitleButton)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newTitleButton.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor),
            newTitleButton.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            newTitleButton.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            newTitleButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
}
