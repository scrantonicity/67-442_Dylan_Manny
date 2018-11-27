//
//  BirthParser.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/26/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class birthParser {
  
  func birthParser(_ data: Data?)-> Response? {
    if let data = data,
      let result = try? JSONDecoder().decode(Response.self, from: data){
      print("got data")
      return result
    } else {
      print("Error in Decoding Data")
      return nil
    }
  }
  
  
  func birthsFromWiki(_ data:Data?) -> [Birth]? {
    guard let result = birthParser(data) else {
      print("Error: couldn't parse result from data")
      return nil
    }

    return result.data.births
  }
  
  
}
