//
//  SongDetailsViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/29/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class SongDetailsViewModelTests: XCTestCase {

  func test_convertToURL() {
    let uri = "spotify:track:0e7ipj03S05BNilyu5bRzt"
    let viewModel = SongDetailsViewModel(song: Song(date: "2018-11-30", title: "People Person's Paper People", artist: "Scrantonicity", url: "https://google.com"))
    
    XCTAssertEqual(viewModel.convertToURL(uri: uri), "https://open.spotify.com/track/0e7ipj03S05BNilyu5bRzt")
  }
  
}
