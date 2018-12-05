//
//  ArticleDetailsViewModel.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/8/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

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
  
}

