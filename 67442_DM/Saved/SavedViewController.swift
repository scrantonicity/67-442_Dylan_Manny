//
//  SavedViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/29/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import CoreData

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
    //loading in saved data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EventModel")
    request.returnsObjectsAsFaults = false
    do {
      let result = try context.fetch(request)
      for data in result as! [NSManagedObject] {
        self.loadingSaved(data: data)
//        print(data.value(forKey: "headline") as! String)
      }
    } catch {
      print("Failed")
    }
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
//    tableView.reloadData()
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
//    print(viewModel.numberOfRows())
    return viewModel.numberOfRows()
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "acell", for: indexPath) as! HeadlineTableViewCell
    cell.headline?.text = viewModel.headlineForRowAtIndexPath(indexPath)
    //    cell.headline?.numberOfLines = 0
    cell.year?.text = viewModel.yearForRowAtIndexPath(indexPath)
    let fontName = getFont(year: Int(viewModel.yearForRowAtIndexPath(indexPath)) ?? 0)
    cell.year?.font = UIFont(name: fontName, size: 17)
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
  
  // MARK: - Loading
  func loadingSaved(data: NSManagedObject) {
    let linkString = data.value(forKey: "links") as! String
    let links = viewModel.createLinkArray(linkString)
    let year = data.value(forKey: "date") as! String
    let title = data.value(forKey: "headline") as! String
    let newEvent = Event(year: year, headline: title, links: links)
    savedArticles.append(newEvent)
    savedDict[newEvent.headline] = newEvent
  }
  
  
}

