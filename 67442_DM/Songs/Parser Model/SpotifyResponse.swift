//
//  SpotifyResponse.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

struct SpotifyResponse: Decodable {
  
  let track: SpotifyTrack
  
  enum CodingKeys : String, CodingKey {
    case track = "tracks"
  }
}
