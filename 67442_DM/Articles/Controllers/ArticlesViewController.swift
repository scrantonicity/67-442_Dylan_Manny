//
//  ArticlesViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
//class ArticlesViewController: UITableViewController {
  // MARK: - Properties & Outlets
  let viewModel = ArticlesViewModel()
  
  @IBOutlet var tableView: UITableView!
  
  // MARK: - viewDidLoad, WillAppear
  override func viewDidLoad() {
    super.viewDidLoad()
    // register the nib
    let cellNib = UINib(nibName: "HeadlineTableViewCell", bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: "acell")
    // get the data for the table
    viewModel.refresh { [unowned self] in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  
  // MARK: - Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "acell", for: indexPath) as! HeadlineTableViewCell
    cell.headline?.text = viewModel.headlineForRowAtIndexPath(indexPath)
    cell.year?.text = viewModel.yearForRowAtIndexPath(indexPath)
    return cell
  }
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//    performSegue(withIdentifier: "toDetailArticle", sender: indexPath)
//  }
  

}

//
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    // register the nib
//    let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
//    tableView.register(cellNib, forCellReuseIdentifier: "cell")
//    // set up the search bar (method below)
//    setupSearchBar()
//    // get the data for the table
//    viewModel.refresh { [unowned self] in
//      DispatchQueue.main.async {
//        self.tableView.reloadData()
//      }
//    }
//  }
//
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    if let selectedRow = tableView.indexPathForSelectedRow {
//      tableView.deselectRow(at: selectedRow, animated: true)
//    }
//  }

//
//  // MARK: - Segues
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if let detailVC = segue.destination as? RepositoryDetailViewController,
//      let indexPath = sender as? IndexPath {
//      detailVC.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
//    }
//  }
//
//}
