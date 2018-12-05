//
//  SavedViewModel.swift
//  TimeFeed
//
//  Created by Manuel Lopez on 12/29/18.
//  Copyright © 2018 Manuel Lopez. All rights reserved.
//

import Foundation

class SavedViewModel {
  var articles = savedArticles
  var reverse = true
  
  
  func numberOfRows() -> Int {
    return articles.count
  }
  
  func headlineForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < articles.count else {
      return ""
    }
    return articles[indexPath.row].headline
  }
  
  func yearForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < articles.count else {
      return ""
    }
    return articles[indexPath.row].year
  }
  
  func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> ArticleDetailsViewModel {
    let article = articles[indexPath.row]
    print("created ArticleDetailsViewModel")
    return ArticleDetailsViewModel(article: article)
  }
  
  func createLinkArray(_ linkString: String) -> [Link] {
    var array:[Link] = []
    let seperatedString = linkString.split(separator: ";")
    for pair in seperatedString {
      let link = createLink(String(pair))
      array.append(link)
    }
    return array
  }
  
  func createLink(_ string:String) -> Link{
    //given "title, url"
    let lines = string.split(separator: ",")
    let title = String(lines[0])
    let url = String(lines[1])
    let newLink = Link(title: title, url: url)
    return newLink
  }
  
  
}


