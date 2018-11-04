//
//  WikiParser.swift
//  TimeFeed
//
//  Created by Manuel Lopez on 10/31/18.
//  Copyright © 2018 Manuel Lopez. All rights reserved.
//

import Foundation

class Parser {
  
  func parseWiki(_ data: Data?)-> Response? {
    if let data = data,
      let result = try? JSONDecoder().decode(Response.self, from: data){
      return result
    } else {
      print("Error in Decoding Data")
      return nil
    }
  }
  
  
  func articlesFromWiki(_ data:Data?) -> [Event]? {
    guard let result = parseWiki(data) else {
      print("Error: couldn't parse result from data")
      return nil
    }
    
    return result.data.events
  }
  
  
}



