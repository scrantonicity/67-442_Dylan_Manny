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
  @IBOutlet weak var filter: UIBarButtonItem!
  
  // MARK: - viewDidLoad, WillAppear
  override func viewDidLoad() {
    super.viewDidLoad()
    // register the nib
    let cellNib = UINib(nibName: "Headline", bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: "acell")
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
    // get the data for the table
    self.refresh()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
  }
  
  //MARK: - Actions
  
  @IBAction func filterHit(_ sender: Any) {
    if viewModel.reverse {
      viewModel.reverse = false
    } else {
      viewModel.reverse = true
    }
    self.refresh()
  }
  
  
  // MARK: - Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "acell", for: indexPath) as! HeadlineTableViewCell
    cell.headline?.text = viewModel.headlineForRowAtIndexPath(indexPath)
//    cell.headline?.numberOfLines = 0 
    cell.year?.text = viewModel.yearForRowAtIndexPath(indexPath)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    performSegue(withIdentifier: "showArticleDetails", sender: indexPath)
  }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let detailArticle = segue.destination as? ArticleDetailsViewController,
      let indexPath = sender as? IndexPath {
      detailArticle.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
//      detailArticle.article = self.
    }
  }
  
  func refresh() -> Void {
    viewModel.refresh(month: 11, day: 2) { [unowned self] in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

}

