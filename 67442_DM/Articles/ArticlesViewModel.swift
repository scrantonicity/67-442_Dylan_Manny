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
        for article in articles{
          print(article)
        }
      }
      completion()
    }
  }
  
}


