//
//  DeathViewModel.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class DeathViewModel {
  var deaths = [Death]()
  
  let client = SearchWikiClient()
  let parser = deathParser()
  
  func refresh(month: Int, day: Int, _ completion: @escaping () -> Void) {
    client.fetchWikiInfo(month: month, day: day) { [unowned self] data in
      if let deaths = self.parser.deathsFromWiki(data) {
        self.deaths = deaths
      }
      completion()
    }
  }
  
  func numberOfRows() -> Int {
    return deaths.count
  }
  
  func headlineForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < deaths.count else {
      return ""
    }
    return deaths[indexPath.row].person
  }
  
  func yearForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < deaths.count else {
      return ""
    }
    return deaths[indexPath.row].year
  }
  
//  func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> BirthWebViewModel {
//    let birthDetail = deaths[indexPath.row]
//    return BirthWebViewModel(birth: birthDetail)
//  }
  
  
}
