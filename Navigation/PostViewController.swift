//
//  PostViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 18.07.2022.
//

import UIKit

class PostViewController: UIViewController{
    
    var titlePost: String = "My post"
    
    override func viewDidLoad() {

            super.viewDidLoad()

            self.view.backgroundColor = .lightGray
        
        self.navigationItem.title = titlePost
    
        }
}
