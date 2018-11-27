//
//  Result.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

struct Result: Decodable {
  let songs: [Song]
  
  enum CodingKeys : String, CodingKey {
    case songs
  }
}
