//
//  HomeViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var date: UILabel!

    override func viewDidLoad() {
      super.viewDidLoad()
      date.text = getCurrentDate()
    }
  
  @IBAction func articlesButtonTapped() {
    // Create a new "Storyboard2" instance
    let storyboard = UIStoryboard(name: "Articles", bundle: nil)
    
    // Create an instance of the storyboard's initial view controller
    let controller = storyboard.instantiateViewController(withIdentifier: "ArticlesController") as UIViewController
    
    // Display the new view controller
    present(controller, animated: true, completion: nil)
  }
  
//  func getCurrentDate() -> String {
//    let dateCurrent = Date()
//    let calendar = Calendar.current
//    let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
//    return "\(components.month!)/\(components.day!)"
//  }
  
  func getCurrentDate() -> String {
    let months:[Int:String] = [1:"January", 2:"February", 3:"March", 4: "April", 5:"May",
                               6:"June", 7:"July", 8:"August", 9:"September", 10:"October",
                               11:"November", 12:"December"]
    let dateCurrent = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
    let currentMonth = components.month!
    let ending = getNumEnding(year: components.day!)
    return "\(months[currentMonth]!) \(components.day!)\(ending), \(components.year!)"
  }
  
  func getNumEnding(year: Int) -> String {
    switch year % 10 {
    case 1:
      return "st"
    case 2:
      return "nd"
    case 3:
      return "rd"
    default:
      return "th"
    }
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
