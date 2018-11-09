//
//  ArticlesViewModel.swift
//  TimeFeed
//
//  Created by Manuel Lopez on 10/31/18.
//  Copyright © 2018 Manuel Lopez. All rights reserved.
//

import Foundation

class ArticlesViewModel {
  var articles = [Event]()
  
  let client = SearchArticlesClient()
  let parser = Parser()
  
  func refresh(month: Int, day: Int, _ completion: @escaping () -> Void) {
    client.fetchArticles(month: month, day: day) { [unowned self] data in
      if let articles = self.parser.articlesFromWiki(data) {
        self.articles = articles
//        for article in articles{
//          print(article)
//        }
      }
      completion()
    }
  }
  
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
  
//  func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> RepositoryDetailViewModel {
//    let repo = (filteredRepos.isEmpty ? repos[indexPath.row] : filteredRepos[indexPath.row])
//    return RepositoryDetailViewModel(repository: repo)
//  }
  
}


