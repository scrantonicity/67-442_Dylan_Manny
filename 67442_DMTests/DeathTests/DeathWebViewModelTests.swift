//
//  DeathWebViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/30/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class DeathWebViewModelTests {
  
  func test_getUrl() {
    let viewModel = DeathWebViewModel(death: createDeath())
    
    XCTAssertEqual(viewModel.getUrl(), "https://DMScranton.com")
  }
  
  func test_getName() {
    let viewModel = DeathWebViewModel(death: createDeath())
    
    XCTAssertEqual(viewModel.getName(), "Ed Truck")
  }
  
  func createDeath() -> Death {
    return Death(year: "2006", person: "Ed Truck", links: [Link(title: "Dunder Mifflin Scranton Managers", url: "https://DMScranton.com")])
  }
  
}
