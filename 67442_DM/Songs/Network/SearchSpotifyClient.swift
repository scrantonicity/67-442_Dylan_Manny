//
//  SpotifySongsClient.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/27/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation
import Alamofire

class SearchSpotifyClient {
  func fetchSpotifySongs(keyword: String, _ completion: @escaping (Data?) -> Void) {
    
    //Must be https or else this will complain
    let urlString = convertToURLString(keyword: keyword)
    print(urlString)
    Alamofire.request(urlString).response { response in
      if let error = response.error {
        print("Error fetching repositories: \(error)")
        print(urlString)
        completion(response.data)
        return
      }
      completion(response.data)
    }
    
  }
  
  func convertToURLString(keyword: String) -> String {
    let head = "https://api.spotify.com/v1/search?q="
    let tail = "&type=track&market=US&limit=1"
    let sep = "%20"
    var body = ""
    var keywordArray: [Substring] = keyword.split(separator: " ")
    for i in 0..<(keywordArray.count-1) {
      let subKeyword = keywordArray[i]
      body += subKeyword + sep
    }
    body += keywordArray[keywordArray.index(before: keywordArray.endIndex)]
    return head+body+tail
  }
}
