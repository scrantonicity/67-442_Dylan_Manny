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
    self.title = "Songs"
    // register the nib
    let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: "scell")
    // get the data for the table
    self.refresh()
  }
  
  func refresh() -> Void {
    viewModel.refresh { [unowned self] in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  //MARK: - Actions
  @IBAction func sortHit() {
    if viewModel.reverse {
      viewModel.reverse = false
    } else {
      viewModel.reverse = true
    }
    self.refresh()
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "scell", for: indexPath) as! TableViewCell
    cell.year?.text = viewModel.yearForRowAtIndexPath(indexPath)
    cell.title?.text = viewModel.titleForRowAtIndexPath(indexPath)
    cell.artist?.text = viewModel.artistForRowAtIndexPath(indexPath)
    let fontName = getFont(year: Int(viewModel.yearForRowAtIndexPath(indexPath)) ?? 0)
    cell.year?.font = UIFont(name: fontName, size: 18)
    cell.title?.font = UIFont(name: fontName, size: 18)
    cell.artist?.font = UIFont(name: fontName, size: 18)
    return cell
  }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      performSegue(withIdentifier: "showSongDetails", sender: indexPath)
    }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let detailSong = segue.destination as? SongDetailsViewController,
      let indexPath = sender as? IndexPath {
      detailSong.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
    }
  }
  
}
