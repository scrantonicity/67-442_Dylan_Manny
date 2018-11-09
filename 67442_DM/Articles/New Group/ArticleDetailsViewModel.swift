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
    print("running headlineAtRow")
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
    print("running linkAtRow")
    guard indexPath.row >= 0 && indexPath.row < article.links.count else {
      print("guard failed")
      return ""
    }
    
    let list = links()
    let result = list[indexPath.row]
    return result.1
  }
  
  //returns list with tuples of titles and urls
  private func links() -> [(String,String)] {
    var list:[(String, String)] = []
    let links = article.links
    for item in links {
      let tuple = (item.title, item.url)
      list.append(tuple)
    }
    return list
  }
}

