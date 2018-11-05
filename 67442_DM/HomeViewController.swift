//
//  HomeViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func articlesButtonTapped() {
    // Create a new "Storyboard2" instance
    let storyboard = UIStoryboard(name: "Articles", bundle: nil)
    
    // Create an instance of the storyboard's initial view controller
    let controller = storyboard.instantiateViewController(withIdentifier: "ArticlesViewController") as UIViewController
    
    // Display the new view controller
    present(controller, animated: true, completion: nil)
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
