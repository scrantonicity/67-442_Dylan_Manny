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
  
//  func refresh() -> Void {
//    client.fetchSpotifySongs(keyword: song.title) { [unowned self] data in
//      if let url = self.parser.spotifySongsFromLoadResponse(data) {
//        self.url = url
//        print("got url!")
//        print(self.url)
//      }
////      completion()
//    }
//  }
  
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
