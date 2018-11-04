//
//  WikiArticlesViewModel.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class WikiArticlesViewModel {
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
