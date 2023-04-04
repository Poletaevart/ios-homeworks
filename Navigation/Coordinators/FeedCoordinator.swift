//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Artem Poletaev on 04.04.2023.
//

import UIKit
 import StorageService

 class FeedCoordinator: Coordinator {
     
     
     var navigationController: UINavigationController

     init(navigationController: UINavigationController) {
         self.navigationController = navigationController
     }

     func start() {
         let feedVC = FeedViewController()
         feedVC.coordinator = self
         feedVC.tabBarItem.title = "Feed"
         feedVC.tabBarItem.image = UIImage(systemName: "newspaper")
         navigationController.pushViewController(feedVC, animated: false)
     }

     func toPostViewController(send post: Post) {
         let postViewController = PostViewController()
         self.navigationController.pushViewController(postViewController, animated: true)
//         postViewController.titlePost = post
     }
 }
