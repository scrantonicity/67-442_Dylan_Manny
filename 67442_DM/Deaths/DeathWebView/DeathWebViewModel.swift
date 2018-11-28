//
//  DeathWebViewModel.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class DeathWebViewModel {
  let death: Death
  
  init(death: Death) {
    self.death = death
  }
  
  func getUrl() -> String {
    let links = death.links
    let first = links[0]
    return first.url
  }
  
  
}
