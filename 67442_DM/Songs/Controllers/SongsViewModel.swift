//
//  SongsViewModel.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

extension String {
  subscript (bounds: CountableClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start...end])
  }
  
  subscript (bounds: CountableRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start..<end])
  }
}

import Foundation
import Alamofire

class SongsViewModel {
  var songs = [Song]()
  var filteredSongs = [Song]()
  
  let client = SearchSongsClient()
  let parser = SongsParser()
  
  func refresh(_ completion: @escaping () -> Void) {
    client.fetchSongs { [unowned self] data in
      if let songs = self.parser.songsFromLoadResponse(data) {
        self.songs = songs
        print("got songs!")
        print(self.songs[0...5])
        print(songs.count)
        self.getSongsForDay(month: 11, day: 6)
      }
      completion()
    }
    
  }
  
  func getSongsForDay(month: Int, day: Int) -> Void {
    for song in self.songs {
      let songMonth:Int?  = Int(song.date[5...6])
      let songDay:Int?  = Int(song.date[8...9])
      if (songMonth == month && songDay == day) {
        filteredSongs.append(song)
      }
    }
  }
  
  func numberOfRows() -> Int {
    return filteredSongs.count
  }
  
  func yearForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < filteredSongs.count else {
      return ""
    }
    return filteredSongs[indexPath.row].date[0...3]
  }
  
  func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < filteredSongs.count else {
      return ""
    }
    return filteredSongs[indexPath.row].title
  }
  
  func artistForRowAtIndexPath(_ indexPath: IndexPath) -> String {
    guard indexPath.row >= 0 && indexPath.row < filteredSongs.count else {
      return ""
    }
    return filteredSongs[indexPath.row].artist
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
