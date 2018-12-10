//
//  SongsViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/9/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class SongsViewModelTests: XCTestCase {
  
  func test_numberOfRows() {
    let songs = [createSong(), createSong(), createSong()]
    let viewModel = SongsViewModel()
    viewModel.filteredSongs = songs
    
    XCTAssertEqual(viewModel.numberOfRows(), 3)
  }
  
  func test_yearForRowAtIndexPath() {
    let song1 = Song(date: "1981-07-12", title: "Freeze Frame", artist: "J. Geils Band", url: "https://kiltieband.com/halfrest")
    let song2 = Song(date: "1988-05-12", title: "Proud Mary", artist: "Tina Turner", url: "https://kiltiband.com/steamboat")
    let viewModel = SongsViewModel()
    viewModel.filteredSongs = [song1, song2]
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath1), "1981")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath2), "1988")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath3), "")
  }
  
  func test_titleForRowAtIndexPath() {
    let song1 = Song(date: "1981-07-12", title: "Freeze Frame", artist: "J. Geils Band", url: "https://kiltieband.com/halfrest")
    let song2 = Song(date: "1988-05-12", title: "Proud Mary", artist: "Tina Turner", url: "https://kiltiband.com/steamboat")
    let viewModel = SongsViewModel()
    viewModel.filteredSongs = [song1, song2]
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath1), "Freeze Frame")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath2), "Proud Mary")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath3), "")
  }
  
  func test_artistForRowAtIndexPath() {
    let song1 = Song(date: "1981-07-12", title: "Freeze Frame", artist: "J. Geils Band", url: "https://kiltieband.com/halfrest")
    let song2 = Song(date: "1988-05-12", title: "Proud Mary", artist: "Tina Turner", url: "https://kiltiband.com/steamboat")
    let viewModel = SongsViewModel()
    viewModel.filteredSongs = [song1, song2]
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.artistForRowAtIndexPath(indexPath1), "J. Geils Band")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.artistForRowAtIndexPath(indexPath2), "Tina Turner")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.artistForRowAtIndexPath(indexPath3), "")
  }
  
  func createSong() -> Song {
    return Song(date: "2018-01-01", title: "TestTitle", artist: "TestArtist", url: "https://example.com")
  }
}
