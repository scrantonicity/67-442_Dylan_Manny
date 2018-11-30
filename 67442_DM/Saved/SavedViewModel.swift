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
  
//  let client = SearchArticlesClient()
//  let parser = Parser()
  
  
//  func refresh(month: Int, day: Int, _ completion: @escaping () -> Void) {
//    print("running refresh")
//    client.fetchArticles(month: month, day: day) { [unowned self] data in
//      print("fetched articles")
//      if let articles = self.parser.articlesFromWiki(data) {
//        print("finished refresh")
//        if self.reverse {
//          self.articles = articles.reversed()
//        } else {
//          self.articles = articles
//        }
//        //        for article in articles{
//        //          print(article)
//        //        }
//      }
//      completion()
//    }
//  }
  
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
    return ArticleDetailsViewModel(article: article)
  }
  
  
}


