//
//  BirthsViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/30/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class BirthViewModelTests: XCTestCase {
  
  func test_numberOfRows() {
    
    let births = [createBirth(), createBirth(), createBirth()]
    let viewModel = BirthViewModel()
    viewModel.births = births
    
    XCTAssertEqual(viewModel.numberOfRows(), 3)
  }
  
  func test_headlineForRowAtIndexPath() {
    let birth1 = createBirth()
    let birth2 = Birth(year: "2005", person: "The Office", links: [])
    let births = [birth1, birth2]
    let viewModel = BirthViewModel()
    viewModel.births = births
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath1), "Timefeed")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath2), "The Office")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath3), "")
  }
  
  func test_yearForRowAtIndexPath() {
    let birth1 = createBirth()
    let birth2 = Birth(year: "2005", person: "The Office", links: [])
    let births = [birth1, birth2]
    let viewModel = BirthViewModel()
    viewModel.births = births
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath1), "2018")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath2), "2005")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath3), "")
  }
  
  func createBirth() -> Birth {
    return Birth(year: "2018", person: "Timefeed", links: [Link(title: "About Us", url: "https://google.com")])
  }
  
}
