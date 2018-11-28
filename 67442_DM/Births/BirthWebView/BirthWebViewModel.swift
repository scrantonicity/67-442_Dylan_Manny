//
//  BirthWebViewModel.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class BirthWebViewModel {
  let birth: Birth
  
  init(birth: Birth) {
    self.birth = birth
  }
  
  func getUrl() -> String {
    let links = birth.links
    let first = links[0]
    return first.url
  }

  
}
