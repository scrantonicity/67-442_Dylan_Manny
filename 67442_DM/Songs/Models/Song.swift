//
//  Song.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

struct Song: Decodable {
  let date: String
  let title: String
  let artist: String
  let url: String
  
  enum CodingKeys : String, CodingKey {
    case date
    case title
    case artist
    case url
  }
}
