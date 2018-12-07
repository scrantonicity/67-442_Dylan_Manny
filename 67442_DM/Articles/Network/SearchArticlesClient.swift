//
//  SearchArticlesClient.swift
//  TimeFeed
//
//  Created by Manuel Lopez on 10/31/18.
//  Copyright © 2018 Manuel Lopez. All rights reserved.
//

import Foundation
import Alamofire

class SearchArticlesClient {
  func fetchArticles(month: Int, day: Int, _ completion: @escaping (Data?) -> Void) {
    
    //Must be https or else this will complain
    let urlString = "https://history.muffinlabs.com/date/\(month)/\(day)"
    let url = Bundle.main.url(forResource: "dec7", withExtension: "json")
    
    print(urlString)
    Alamofire.request(url!).response { response in
      if let error = response.error {
        print("Error fetching repositories: \(error)")
        completion(response.data)
        return
      }
      print("network call successful")
      completion(response.data)
    }
    
  }
}

