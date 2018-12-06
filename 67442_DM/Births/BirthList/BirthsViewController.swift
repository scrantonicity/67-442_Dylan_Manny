//
//  BirthsViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/26/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import Foundation

class BirthsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
  //class ArticlesViewController: UITableViewController {
  // MARK: - Properties & Outlets
  let viewModel = BirthViewModel()
  
  
  
  @IBOutlet var tableView: UITableView! 
  @IBOutlet weak var sort: UIBarButtonItem!
  
  // MARK: - viewDidLoad, WillAppear
  override func viewDidLoad() {
    super.viewDidLoad()
    let cellNib = UINib(nibName: "BirthCell", bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: "birthCell")
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
  @IBAction func sortHit() {
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "birthCell", for: indexPath) as! BirthCellTableViewCell
    cell.person?.text = viewModel.headlineForRowAtIndexPath(indexPath)
    //    cell.headline?.numberOfLines = 0
    cell.year?.text = viewModel.yearForRowAtIndexPath(indexPath)
    let fontName = getFont(year: Int(viewModel.yearForRowAtIndexPath(indexPath)) ?? 0)
    cell.person.font = UIFont(name: fontName, size: 17)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    performSegue(withIdentifier: "showBirthDetails", sender: indexPath)
  }
  
//   MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let birthWebView = segue.destination as? BirthWebViewController,
      let indexPath = sender as? IndexPath {
      birthWebView.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
    }
  }

  
  
  
  func refresh() -> Void {
    let date = getCurrentDate()
    let month = Int(date.0)!
    let day = Int(date.1)!
    print(day)
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
