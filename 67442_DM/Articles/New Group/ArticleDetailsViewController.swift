//
//  ArticleDetailsViewController.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/8/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import CoreData

class ArticleDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var viewModel: ArticleDetailsViewModel?
  
  @IBOutlet weak var headline: UILabel!
  //@IBOutlet weak var year: UILabel!
  @IBOutlet var tableView: UITableView!
  @IBOutlet weak var shareButton: UIBarButtonItem!
  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var backgroundImage: UIImageView!
//  @IBOutlet weak var tableViewLabel: UILabel!

    override func viewDidLoad() {
      super.viewDidLoad()
      headline.text = viewModel?.article.headline
//      year.text = viewModel?.article.year
      //year.text = viewModel?.date()
//      let cellNib = UINib(nibName: "Links", bundle: nil)
//      tableView.register(cellNib, forCellReuseIdentifier: "linkcell")
      self.title = viewModel?.date()
      setFonts()
      self.backgroundImage.image = getImage(year: Int((viewModel?.article.year)!)!)
      self.saveButton.tintColor = viewModel!.updateSavedColor()
      tableView.reloadData()
    }
  
  func setFonts() -> Void {
    let fontName = getFont(year: Int((viewModel?.article.year)!) ?? 0)
    headline.font = UIFont(name: fontName, size: 18)
//    tableViewLabel.font = UIFont(name: (viewModel?.font)!, size: 18)
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
    
  }
  
  @IBAction func shareButtonTapped(_ sender: Any) {
    let text = viewModel!.article.headline
    let year = viewModel!.article.year
    let textToShare = "Did you know? On \(String(describing: year)), \(String(describing: text))"
    
    let ac = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
    present(ac, animated: true)
//    navigationController?.present(activityViewController, animated: true)
  }
  
  @IBAction func saveButtonTapped() {
    viewModel?.savedButtonTapped(self.viewModel!.article)
    self.saveButton.tintColor = self.viewModel!.updateSavedColor()
  }
  
  
  // MARK: - Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel!.numberOfRows()
  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "lcell", for: indexPath)
    cell.textLabel?.text = viewModel?.headlineAtRow(indexPath)
    let fontName = getFont(year: Int((viewModel?.article.year)!) ?? 0)
    cell.textLabel?.font = UIFont(name: fontName, size: 17)
//    cell. = UIFont(name: (viewModel?.font)!, size: 16)
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
  
//  func saveEvent(_ event: Event){
//    // Connect to the context for the container stack
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    let context = appDelegate.persistentContainer.viewContext
//    // Specifically select the Event entity to save this object to
//    let entity = NSEntityDescription.entity(forEntityName: "EventModel", in: context)
//    let newEvent = NSManagedObject(entity: entity!, insertInto: context)
//    // setting values for links
//    let link = viewModel!.createLinkString(viewModel!.links())
//    // Set values for events
//    newEvent.setValue(viewModel?.article.headline, forKey: "headline")
//    newEvent.setValue(viewModel?.article.year, forKey:"date")
//    newEvent.setValue(link, forKey: "links")
//    do {
//      try context.save()
//      print("saved to core data")
//    } catch {
//      print("Failed saving")
//    }
//  }
  
}
