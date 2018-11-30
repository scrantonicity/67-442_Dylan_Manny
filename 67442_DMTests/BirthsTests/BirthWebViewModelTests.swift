//
//  BirthDetailsViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/30/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class BirthWebViewModelTests {
  
  func test_getUrl() {
    let viewModel = BirthWebViewModel(birth: createBirth())
    
    XCTAssertEqual(viewModel.getUrl(), "https://google.com")
  }
  
  func test_getName() {
    let viewModel = BirthWebViewModel(birth: createBirth())
    
    XCTAssertEqual(viewModel.getName(), "Timefeed")
  }
  
  func createBirth() -> Birth {
    return Birth(year: "2018", person: "Timefeed", links: [Link(title: "About Us", url: "https://google.com")])
  }
  
}
