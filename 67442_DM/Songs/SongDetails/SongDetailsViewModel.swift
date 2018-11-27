//
//  SongDetailsViewModel.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/26/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation

class SongDetailsViewModel {
  
  let song: Song
  var url: String
  
  let client = SearchSpotifyClient()
  let parser = SpotifyParser()
  
  init(song: Song) {
    self.song = song
  }
  
  func refresh() -> Void {
    client.fetchSpotifySongs(keyword: song.title) { [unowned self] data in
      if let url = self.parser.spotifySongsFromLoadResponse(data) {
        self.url = url
        print("got url!")
        print(self.url)
      }
      completion()
    }
  }
  
  
}
