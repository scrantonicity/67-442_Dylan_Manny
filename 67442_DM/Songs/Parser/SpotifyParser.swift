//
//  SpotifyParser.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

//typealias JSONDictionary = [String: AnyObject]

class SpotifyParser {
  func parseDictionary(_ data: Data?) -> SpotifyResponse? {
    print("starting parsing")
    if let data = data,
      let json = try? JSONDecoder().decode(SpotifyResponse.self, from: data) {
      return json
    }  else {
      return nil
    }
  }
  
  func spotifySongsFromLoadResponse(_ data: Data?) -> String? {
    guard let result = parseDictionary(data) else {
      print("Error: couldn't parse result from data")
      return nil
    }
    print("Got result from data")
    return result.track.item.link
  }
  
}
