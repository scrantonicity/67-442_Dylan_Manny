//
//  ArticleDetailsViewModel.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/8/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ArticleDetailsViewModel {
  let article: Event
  
  init(article: Event) {
    self.article = article
  }
  
  func numberOfRows() -> Int {
    return article.links.count
  }
  
  //should change to titleAtRow to avoid confusion
  func headlineAtRow(_ indexPath: IndexPath) -> String {
//    print("running headlineAtRow")
    guard indexPath.row >= 0 && indexPath.row < article.links.count else {
      print("guard failed")
      return ""
    }
    let list = links()
//    print("lists: \(list)")
    let result = list[indexPath.row]
//    print("result: \(result)")
    return result.0
  }
  
  func linkAtRow(_ indexPath: IndexPath) -> String {
//    print("running linkAtRow")
    guard indexPath.row >= 0 && indexPath.row < article.links.count else {
      print("guard failed")
      return ""
    }
    
    let list = links()
    let result = list[indexPath.row]
    return result.1
  }
  
  // Possibly have it return in name format i.e Nov instead of 11
  func date() -> String {
    let months:[Int:String] = [1:"Jan", 2:"Feb", 3:"Mar", 4: "Apr", 5:"May",
                               6:"Jun", 7:"Jul", 8:"Aug", 9:"Sep", 10:"Oct",
                               11:"Nov", 12:"Dec"]
    let dateCurrent = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
    let year = article.year
    let currentMonth = components.month!
    return "\(months[currentMonth]!) \(components.day!), \(year)"
  }
  
  //returns list with tuples of titles and urls
  func links() -> [(String,String)] {
    var list:[(String, String)] = []
    let links = article.links
    for item in links {
      let tuple = (item.title, item.url)
      list.append(tuple)
    }
    return list
  }
  
  func createLinkString(_ links: [(String,String)]) -> String {
    var result:String = ""
    //    let links = viewModel?.links()
    for link in links {
      let title = link.0
      let url = link.1
      let pair = "\(title),\(url);"
      result += pair
    }
    return result
  }
  
  func savedButtonTapped(_ event: Event) {
    let key = event.headline
    if savedDict.removeValue(forKey:key) != nil {
      self.removeFromArray(event)
      self.removeFromCore()
      print("Removed! The Dictionary now has \(savedDict.count) entries")
    } else {
      savedArticles.append(event)
      savedDict[key] = event
      saveEvent(article)
      print("Added! Dictionary now has \(savedDict.count) entries \n")
    }
  }
  
  func isSaved() -> Bool{
    let key = self.article.headline
    if let _ = savedDict[key] {
      print("is saved")
      return true
    }
    print("not saved")
    return false
  }
  
  func updateSavedColor() -> UIColor{
    if isSaved() {
      print("now white")
      return UIColor.white
    }
    print("now black")
    return UIColor.black
  }
  
  func removeFromCore() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EventModel")
    request.returnsObjectsAsFaults = false
    do {
      let result = try context.fetch(request)
      for data in result as! [NSManagedObject] {
        // if the contact we are deleting is the same as this one in CoreData
        if data.value(forKeyPath: "headline") as? String == article.headline{
            context.delete(data)
            try context.save()
          print("Fully removed from core")
          }
        }
    } catch {
      print("Failed")
    }
  }
  
  func removeFromArray(_ event: Event) {
    let title = event.headline
    var count = 0
    for item in savedArticles{
      if title == item.headline{
        savedArticles.remove(at: count)
      }
      count += 1
    }
  }
  
  func saveEvent(_ event: Event){
    // Connect to the context for the container stack
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    // Specifically select the Event entity to save this object to
    let entity = NSEntityDescription.entity(forEntityName: "EventModel", in: context)
    let newEvent = NSManagedObject(entity: entity!, insertInto: context)
    // setting values for links
//    let link = viewModel!.createLinkString(viewModel!.links())
    let link = createLinkString(self.links())
    // Set values for events
    newEvent.setValue(article.headline, forKey: "headline")
    newEvent.setValue(article.year, forKey:"date")
    newEvent.setValue(link, forKey: "links")
    do {
      try context.save()
      print("saved to core data")
    } catch {
      print("Failed saving")
    }
  }
  
  
}

