//
//  SavedViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/29/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class SavedViewController: UITableViewController {
  
  // MARK: - Properties & Outlets
  let viewModel = SavedViewModel()
  
  
//  @IBOutlet var tableView: UITableView!
//  @IBOutlet weak var filter: UIBarButtonItem!
  
  // MARK: - viewDidLoad, WillAppear
  override func viewDidLoad() {
    super.viewDidLoad()
    print("loaded saved")
    // register the nib
    let cellNib = UINib(nibName: "Headline", bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: "acell")
    // get the data for the table
    tableView.reloadData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.articles = savedArticles
    tableView.reloadData()
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
  }
  
  //MARK: - Actions
  
//  @IBAction func filterHit(_ sender: Any) {
//    if viewModel.reverse {
//      viewModel.reverse = false
//    } else {
//      viewModel.reverse = true
//    }
//    self.refresh()
//  }
  
  
  // MARK: - Table View
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(viewModel.numberOfRows())
    return viewModel.numberOfRows()
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "acell", for: indexPath) as! HeadlineTableViewCell
    cell.headline?.text = viewModel.headlineForRowAtIndexPath(indexPath)
    //    cell.headline?.numberOfLines = 0
    cell.year?.text = viewModel.yearForRowAtIndexPath(indexPath)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    performSegue(withIdentifier: "showSavedArticleDetails", sender: indexPath)
  }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let detailArticle = segue.destination as? ArticleDetailsViewController,
      let indexPath = sender as? IndexPath {
      detailArticle.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
      //      detailArticle.article = self.
    }
  }
  
//  func refresh() -> Void {
//    let date = getCurrentDate()
//    let month = Int(date.0)!
//    let day = Int(date.1)!
//    viewModel.refresh(month: month, day: day) { [unowned self] in
//      DispatchQueue.main.async {
//        self.tableView.reloadData()
//      }
//    }
//  }
  
//  func getCurrentDate() -> (String, String) {
//    let dateCurrent = Date()
//    let calendar = Calendar.current
//    let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
//    return ("\(components.month ?? 1)", "\(components.day ?? 1)")
//  }
  
}

