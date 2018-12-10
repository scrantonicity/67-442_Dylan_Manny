//
//  DeathViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/30/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class DeathViewModelTests: XCTestCase {
  
  func test_numberOfRows() {
    
    let deaths = [createDeath(), createDeath(), createDeath()]
    let viewModel = DeathViewModel()
    viewModel.deaths = deaths
    
    XCTAssertEqual(viewModel.numberOfRows(), 3)
  }
  
  func test_headlineForRowAtIndexPath() {
    let death1 = createDeath()
    let death2 = Death(year: "2006", person: "A Bird", links: [])
    let deaths = [death1, death2]
    let viewModel = DeathViewModel()
    viewModel.deaths = deaths
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath1), "Ed Truck")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath2), "A Bird")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath3), "")
  }
  
  func test_yearForRowAtIndexPath() {
    let death1 = createDeath()
    let death2 = Death(year: "2006", person: "A Bird", links: [])
    let deaths = [death1, death2]
    let viewModel = DeathViewModel()
    viewModel.deaths = deaths
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath1), "2006")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath2), "2006")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath3), "")
  }
  
  func createDeath() -> Death {
    return Death(year: "2006", person: "Ed Truck", links: [])
  }
  
}
