//
//  ViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/8/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController, UITabBarControllerDelegate {
  
  // UITabBarDelegate
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    setUpTabBar()
  }
  
  // UITabBarControllerDelegate
  private func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
  }
  
//  @IBOutlet weak var songsViewController:

  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    setUpTabBar()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    setUpTabBar()
  }
  
  func setUpTabBar() -> Void {
    let tabs = self.tabBar.items
//    let eventsItem = tabs![0]
//    let birthsItem = tabs![1]
//    let deathsItem = tabs![2]
//    let songsItem = tabs![3]
    let savedItem = tabs![4]
    savedItem.image = UIImage(named: "saved")
    setTintColor()
  }
  
  func setTintColor() -> Void {
    switch self.tabBar.selectedItem {
    case (self.tabBar.items![0]):
      self.tabBar.tintColor = UIColor(red:0.00, green:0.60, blue:1.00, alpha:1.0)
    case (self.tabBar.items![1]):
      self.tabBar.tintColor = UIColor(red:0.60, green:0.20, blue:1.00, alpha:1.0)
    case (self.tabBar.items![2]):
      self.tabBar.tintColor = UIColor(red:1.00, green:0.20, blue:0.20, alpha:1.0)
    case (self.tabBar.items![3]):
      self.tabBar.tintColor = UIColor(red:0.20, green:0.80, blue:0.40, alpha:1.0)
    case (self.tabBar.items![4]):
      self.tabBar.tintColor = UIColor(red:1.00, green:0.60, blue:0.00, alpha:1.0)
    default:
      self.tabBar.tintColor = UIColor(red:0.00, green:0.60, blue:1.00, alpha:1.0)
    }
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
