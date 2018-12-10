//
//  ArticlesViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/9/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class ArticlesViewModelTests: XCTestCase {

  func test_numberOfRows() {
    let events = [createEvent(), createEvent(), createEvent()]
    let viewModel = ArticlesViewModel()
    viewModel.articles = events
    
    XCTAssertEqual(viewModel.numberOfRows(), 3)
  }
  
  func test_headlineForRowAtIndexPath() {
    let event1 = Event(year: "2016", headline: "Broncos beat Patriots, advance to Super Bowl", links: [])
    let event2 = Event(year: "2018", headline: "Capitals beat Penguins finally.", links: [])
    let events = [event1, event2]
    let viewModel = ArticlesViewModel()
    viewModel.articles = events
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath1), "Broncos beat Patriots, advance to Super Bowl")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath2), "Capitals beat Penguins finally.")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.headlineForRowAtIndexPath(indexPath3), "")
  }
  
  func test_yearForRowAtIndexPath() {
    let event1 = Event(year: "2016", headline: "Broncos beat Patriots, advance to Super Bowl", links: [])
    let event2 = Event(year: "2018", headline: "Capitals beat Penguins finally.", links: [])
    let events = [event1, event2]
    let viewModel = ArticlesViewModel()
    viewModel.articles = events
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath1), "2016")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath2), "2018")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.yearForRowAtIndexPath(indexPath3), "")
  }
  
  func createEvent() -> Event {
    return Event(year: "2018", headline: "TestHeadline", links: [])
  }

  
}
