//
//  SongDetailsViewModel.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/26/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation
import SpotifyKit

class SongDetailsViewModel {
  let song: Song
  var url = String()
  
//  let client = SearchSpotifyClient()
//  let parser = SpotifyParser()
  
  init(song: Song) {
    self.song = song
  }
  
  func date() -> String {
    let months:[Int:String] = [1:"Jan", 2:"Feb", 3:"Mar", 4: "Apr", 5:"May",
                               6:"Jun", 7:"Jul", 8:"Aug", 9:"Sep", 10:"Oct",
                               11:"Nov", 12:"Dec"]
    let dateCurrent = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
    let year = song.date[0...3]
    let currentMonth = components.month!
//    return "\(months[currentMonth]!) \(components.day!), \(year)"
    return "\(months[currentMonth]!) 7, \(year)"
  }
  
  func openSpotify() -> Void {
    spotifyManager.authorize()
    spotifyManager.find(SpotifyTrack.self, song.title) { tracks in
      let uri = tracks[0].uri
      print(uri)
      let urlLink = self.convertToURL(uri: uri)
      print(urlLink)
      guard let url = URL(string: urlLink) else { return }
      UIApplication.shared.open(url)
    }
  }
  
  
  func convertToURL(uri: String) -> String {
    let head = "https://open.spotify.com/track/"
    let index = uri.index(uri.startIndex, offsetBy: 14)
    let body = uri[index...]
    return head+body
  }
}
