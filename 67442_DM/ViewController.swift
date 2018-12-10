//
//  ViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/3/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let viewModel = WikiArticlesViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    //Code to test view model
    viewModel.refresh(month: 11, day: 2) { [unowned self] in
      DispatchQueue.main
    }
    print("view did load")
    
  }


}

