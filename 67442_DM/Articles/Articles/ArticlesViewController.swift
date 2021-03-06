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
    // get the data for the table
    self.refresh()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print("article view appearing")
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: false)
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
    let fontName = getFont(year: Int(viewModel.yearForRowAtIndexPath(indexPath)) ?? 0)
    cell.headline?.font = UIFont(name: fontName, size: 17)
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
    let date = getCurrentDate()
    let month = Int(date.0)!
    let day = Int(date.1)!
//    let month = 12
//    let day = 7
    viewModel.refresh(month: month, day: day) { [unowned self] in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  func getCurrentDate() -> (String, String) {
    let dateCurrent = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
    return ("\(components.month ?? 1)", "\(components.day ?? 1)")
  }

}

