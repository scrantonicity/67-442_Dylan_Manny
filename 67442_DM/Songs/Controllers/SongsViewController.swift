//
//  SongsViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/1/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

//class SongsViewController: UITableViewController {
class SongsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  // MARK: - Properties & Outlets
  let viewModel = SongsViewModel()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // register the nib
    let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: "scell")
    // get the data for the table
    viewModel.refresh { [unowned self] in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
  }
  
  // MARK: - Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("calling in data from table view")
    let cell = tableView.dequeueReusableCell(withIdentifier: "scell", for: indexPath) as! TableViewCell
    cell.year?.text = viewModel.yearForRowAtIndexPath(indexPath)
    cell.title?.text = viewModel.titleForRowAtIndexPath(indexPath)
    cell.artist?.text = viewModel.artistForRowAtIndexPath(indexPath)
    return cell
  }
  
  //  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //    performSegue(withIdentifier: "toDetailVC", sender: indexPath)
  //  }
  
  // MARK: - Segues
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //    if let detailVC = segue.destination as? RepositoryDetailViewController,
  //      let indexPath = sender as? IndexPath {
  //      detailVC.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
  //    }
  //  }
  
}
