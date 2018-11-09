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
//  var article: Event
  
  @IBOutlet weak var headline: UILabel!
  @IBOutlet weak var year: UILabel!
  @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
      super.viewDidLoad()
      headline.text = viewModel?.article.headline
      year.text = viewModel?.article.year
      let cellNib = UINib(nibName: "Links", bundle: nil)
      tableView.register(cellNib, forCellReuseIdentifier: "linkcell")
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
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "linkcell", for: indexPath) as! LinksTableViewCell
    cell.title?.text = viewModel?.headline(indexPath) 
    return cell
  }
    

}
