//
//  WikiParser.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
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
