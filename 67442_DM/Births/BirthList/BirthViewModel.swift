//
//  BirthViewModel.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/26/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class BirthViewModel {
  var births = [Birth]()
//  var reverse = false
  
  let client = SearchWikiClient()
  let parser = birthParser()
  
  func refresh(month: Int, day: Int, _ completion: @escaping () -> Void) {
    client.fetchWikiInfo(month: month, day: day) { [unowned self] data in
      if let births = self.parser.birthsFromWiki(data) {
          self.births = births.reversed()
      }
      completion()
    }
  }
  
  func numberOfRows() -> Int {
    return births.count
  }
  
  func headlineForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < births.count else {
      return ""
    }
    return births[indexPath.row].person
  }
  
  func yearForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < births.count else {
      return ""
    }
    return births[indexPath.row].year
  }
  
  func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> BirthWebViewModel {
    let birthDetail = births[indexPath.row]
    return BirthWebViewModel(birth: birthDetail)
  }
  
  
}
