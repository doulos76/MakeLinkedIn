//
//  MainTabBarController.swift
//  MakeLinkedIn
//
//  Created by dave76 on 17/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViewControllers()
  }
  
  func setupViewControllers() {
    let homeController = templateNavController(image: #imageLiteral(resourceName: "iconHome"), rootViewController: HomeController())
    let networkingController = templateNavController(image: #imageLiteral(resourceName: "iconUsers"), rootViewController: NetworkingController())
    let newPostController = templateNavController(image: #imageLiteral(resourceName: "iconPlusSign"), rootViewController: NewPostController())
    let noticeController = templateNavController(image: #imageLiteral(resourceName: "iconAlarm"), rootViewController: NoticeController())
    let careersController = templateNavController(image: #imageLiteral(resourceName: "iconBriefCase"), rootViewController: CareersController())
    
    viewControllers = [
      homeController,
      networkingController,
      newPostController,
      noticeController,
      careersController
    ]
  }
  
  fileprivate func templateNavController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
    let viewController = rootViewController
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.barTintColor = UIColor(red: 8 / 255, green: 94 / 255, blue: 145 / 255, alpha: 1)
    navController.tabBarItem.image = image
    tabBar.tintColor = UIColor(red: 8 / 255, green: 94 / 255, blue: 145 / 255, alpha: 1)
    return navController
  }
  
}
