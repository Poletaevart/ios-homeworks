//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 20.07.2022.
//

import UIKit

class ProfileViewController:UIViewController{
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView(frame: .zero)
        self.view.backgroundColor = .lightGray
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile"
        self.view.addSubview(self.profileHeaderView)
        
    }
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    self.profileHeaderView.frame = CGRect()
        }
}
