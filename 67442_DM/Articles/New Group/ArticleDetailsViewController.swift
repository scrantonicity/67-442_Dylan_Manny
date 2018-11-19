//
//  ArticleDetailsViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/8/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var viewModel: ArticleDetailsViewModel?
  
  @IBOutlet weak var headline: UILabel!
  @IBOutlet weak var year: UILabel!
  @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
      super.viewDidLoad()
      headline.text = viewModel?.article.headline
      year.text = viewModel?.article.year
//      let cellNib = UINib(nibName: "Links", bundle: nil)
//      tableView.register(cellNib, forCellReuseIdentifier: "linkcell")
      tableView.reloadData()
    }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
    
  }
  
  
  // MARK: - Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel!.numberOfRows()
  }
  
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "linkcell", for: indexPath) as! LinksTableViewCell
//    print("getting titles")
//    cell.title?.text = viewModel?.headlineAtRow(indexPath)
//    print(cell.title?.text)
//    return cell
//  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "lcell", for: indexPath)
    cell.textLabel?.text = viewModel?.headlineAtRow(indexPath)
    return cell
  }
  
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let indexPath = self.tableView.indexPathForSelectedRow {
      let link = viewModel?.linkAtRow(indexPath)
      (segue.destination as! ArticleWebViewController).urlString = link
      print("going to link")
    }
  }
  
}
