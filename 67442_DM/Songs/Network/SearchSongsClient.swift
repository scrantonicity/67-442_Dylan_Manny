//
//  SearchSongsClient.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation
import Alamofire

class SearchSongsClient {
  func fetchSongs(_ completion: @escaping (Data?) -> Void) {
    print("starting fetching")
    
    let url = Bundle.main.url(forResource: "billboard", withExtension: "json")
    
    Alamofire.request(url!).response { response in
      if let error = response.error {
        print("Error fetching songs: \(error)")
        completion(response.data)
        return
      }
      print("Fetched songs!")
      completion(response.data)
    }
    
  }
}
