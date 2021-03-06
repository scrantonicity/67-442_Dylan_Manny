//
//  DeathParser.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class deathParser {
  
  func deathParser(_ data: Data?)-> Response? {
    if let data = data,
      let result = try? JSONDecoder().decode(Response.self, from: data){
      print("got data")
      return result
    } else {
      print("Error in Decoding Data")
      return nil
    }
  }


  func deathsFromWiki(_ data:Data?) -> [Death]? {
    guard let result = deathParser(data) else {
      print("Error: couldn't parse death result from data")
      return nil
    }
    print("Data was parsed successfully")
    return result.data.deaths
  }
  
  
}
