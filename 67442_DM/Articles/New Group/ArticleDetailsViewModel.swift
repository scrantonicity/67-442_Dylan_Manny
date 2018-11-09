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
  
  func headline(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < article.links.count else {
    return ""
    }
    let list = links()
    
    let result = list[indexPath.row]
    return result.0
  }
  
  func year() -> String {
    return article.year
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

