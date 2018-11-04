//
//  SongsViewModel.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation
import Alamofire

class SongsViewModel {
  var songs = [Song]()
  //  var filteredSongs = [Song]()
  
  let client = SearchSongsClient()
  let parser = SongsParser()
  
  func refresh(_ completion: @escaping () -> Void) {
    client.fetchSongs { [unowned self] data in
      if let songs = self.parser.songsFromLoadResponse(data) {
        self.songs = songs
        print("got songs!")
        print(self.songs[0...5])
        print(songs.count)
      }
      completion()
    }
    
  }
  
  func numberOfRows() -> Int {
    return songs.count
  }
  
  func yearForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    print(songs[indexPath.row].date)
    guard indexPath.row >= 0 && indexPath.row < songs.count else {
      return ""
    }
    return songs[indexPath.row].date
  }
  
  func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < songs.count else {
      return ""
    }
    return songs[indexPath.row].title
  }
  
  func artistForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < songs.count else {
      return ""
    }
    return songs[indexPath.row].artist
  }
  
  //  func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> RepositoryDetailViewModel {
  //    let repo = (filteredRepos.isEmpty ? repos[indexPath.row] : filteredRepos[indexPath.row])
  //    return RepositoryDetailViewModel(repository: repo)
  //  }
  
  //  func updateFiltering(_ searchText: String) -> Void {
  //    filteredSongs = self.repos.filter { repo in
  //      return repo.name.lowercased().contains(searchText.lowercased())
  //    }
  //  }
}
