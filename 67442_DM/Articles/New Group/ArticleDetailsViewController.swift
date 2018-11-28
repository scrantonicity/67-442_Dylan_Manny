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
  @IBOutlet weak var shareButton: UIBarButtonItem!

    override func viewDidLoad() {
      super.viewDidLoad()
      headline.text = viewModel?.article.headline
//      year.text = viewModel?.article.year
      year.text = viewModel?.date()
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
  
  @IBAction func shareButtonTapped(_ sender: Any) {
    let text = self.headline.text!
    let year = self.year.text!
    let textToShare = "Did you know? On \(year), \(text)"
    
    let ac = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
    present(ac, animated: true)
//    navigationController?.present(activityViewController, animated: true)
  }
  
  
  // MARK: - Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel!.numberOfRows()
  }

  
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
