//
//  SpotifyItem.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

struct SpotifyItem: Decodable {
  
//  let images: [SpotifyImages]
  let link: String
  
  enum CodingKeys : String, CodingKey {
//    case images
    case link = "uri"
  }
  
}
