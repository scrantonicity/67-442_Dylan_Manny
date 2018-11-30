//
//  SpotifyItems.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

struct SpotifyTrackBackup: Decodable {
  let item: SpotifyItemBackup
  
  enum CodingKeys : String, CodingKey {
    case item = "items"
  }
}
