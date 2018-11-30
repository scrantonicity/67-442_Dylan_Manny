//
//  ViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/8/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController, UITabBarControllerDelegate {
  
//  @IBOutlet weak var songsViewController: 

  override func viewDidLoad() {
    super.viewDidLoad()
    print("loaded Tab bAr")
//    let songsViewController = SongsViewController()
//    songsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Songs, tag: 0)
//    let articlesViewController = ArticlesViewController()
//    articlesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Articles, tag: 1)
//    let viewControllerList = [ songsViewController, articlesViewController]
//    viewControllers = viewControllerList
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//
//    // Create Tab one
//    let songsTab = SongsViewController()
//    let songsBarItem = UITabBarItem(title: "Songs", image: UIImage(named: "songsTabDefault.png"), selectedImage: UIImage(named: "songsTabSelected.png"))
//
//    songsTab.tabBarItem = songsBarItem
//
//
//    // Create Tab two
//    let articlesTab = ArticlesViewController()
//    let articlesBarItem = UITabBarItem(title: "Articles", image: UIImage(named: "articlesTabDefault.png"), selectedImage: UIImage(named: "articlesTabSelected.png"))
//
//    articlesTab.tabBarItem = articlesBarItem
//
//
//    self.viewControllers = [songsTab, articlesTab]
  }
  
  // UITabBarControllerDelegate method
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected \(viewController.title!)")
  }
}
