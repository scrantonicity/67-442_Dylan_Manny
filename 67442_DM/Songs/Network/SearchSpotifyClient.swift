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
  var q = String()
  var urlString = String()
  
  
  func fetchSpotifySongs(keyword: String, _ completion: @escaping (Data?) -> Void) {
    //Must be https or else this will complain
    getEncodedStrings(keyword: keyword)
    let oAuthToken = "40bb2b273af94a458b8459e093fa6265"
    let headers: HTTPHeaders = [
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + oAuthToken
    ]
    print(urlString)
    Alamofire.request(self.urlString, method: .get, parameters: ["q":self.q, "type":"track", "market":"US", "limit":"1"], encoding: URLEncoding.default, headers: headers).response { response in
      debugPrint(response)
      if let error = response.error {
        print("Error fetching repositories: \(error)")
        print(self.urlString)
        completion(response.data)
        return
      }
      completion(response.data)
    }
    
  }
  
  func getEncodedStrings(keyword: String) -> Void {
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
    self.q = body
    self.urlString = head+body+tail
  }
}
