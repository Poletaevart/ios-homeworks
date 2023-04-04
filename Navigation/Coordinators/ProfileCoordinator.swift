//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Artem Poletaev on 04.04.2023.
//

import UIKit

 class ProfileCoordinator: Coordinator {

     var navigationController: UINavigationController

     init(navigationController: UINavigationController) {
         self.navigationController = navigationController
     }

     func start() {
         let loginVC = LogInViewController()
         loginVC.coordinator = self
         loginVC.tabBarItem.title = "Profile"
         loginVC.tabBarItem.image = UIImage(systemName: "person")
         navigationController.pushViewController(loginVC, animated: false)
     }

     func toProfileViewController(with user: User) {
         let profileVC = ProfileViewController()
         profileVC.newUser = user
         profileVC.coordinator = self
         navigationController.pushViewController(profileVC, animated: true)
     }

     func toPhotosViewController() {
         let vc = PhotosViewController()
         vc.textTitle = "Photo Gallery"
         indexPath.section == 0 ? navigationController?.pushViewController(vc, animated: true) : nil

//        не работает
         
     }
 }
