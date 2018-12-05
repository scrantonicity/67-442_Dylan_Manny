//
//  ArticlesDetailViewModelTests.swift
//  67442_DMTests
//
//  Created by Dylan Hyun on 11/9/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import XCTest
@testable import DailyArchive

class ArticleDetailsViewModelTests: XCTestCase {
  
  func test_numberOfRows() {
    let event1 = createEvent()
    let viewModel = ArticleDetailsViewModel(article: event1)
    XCTAssertEqual(viewModel.numberOfRows(), 2)
  }
  
  func test_headlineAtRow() {
    let event1 = createEvent()
    let viewModel = ArticleDetailsViewModel(article: event1)
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.headlineAtRow(indexPath1), "Who has two thumbs and hates Todd Packer?")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.headlineAtRow(indexPath2), "Merry Christmas Dwight.")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.headlineAtRow(indexPath3), "")
    
  }
  
  func test_linkAtRow() {
    let event1 = createEvent()
    let viewModel = ArticleDetailsViewModel(article: event1)
    
    let indexPath1 = IndexPath(row: 0, section: 0)
    XCTAssertEqual(viewModel.linkAtRow(indexPath1), "https://media.giphy.com/media/aVOgaQLUVsHss/giphy.gif")
    
    let indexPath2 = IndexPath(row: 1, section: 0)
    XCTAssertEqual(viewModel.linkAtRow(indexPath2), "https://media.giphy.com/media/6IDzg16LaG7yU/giphy.gif")
    
    let indexPath3 = IndexPath(row: 99, section: 99)
    XCTAssertEqual(viewModel.linkAtRow(indexPath3), "")
  }
  
  func createEvent() -> Event {
    return Event(year: "2018", headline: "TestHeadline", links: [Link(title: "Who has two thumbs and hates Todd Packer?", url: "https://media.giphy.com/media/aVOgaQLUVsHss/giphy.gif"), Link(title: "Merry Christmas Dwight.", url: "https://media.giphy.com/media/6IDzg16LaG7yU/giphy.gif")])
  }
  
  let link1 = ( "title1","url1")
  let link2 = ("title2","url2")
  var links:[(String,String)] = []
  
  
  func test_createLinkString() {
    links.append(link1)
    links.append(link2)
    let model = ArticleDetailsViewController()
    let result = model.createLinkString(links)
    XCTAssertEqual(result, "title1,url1;title2,url2;")
  }
  
//  func test_createLink(){
//    let string = "title, url"
//    let event1 = createEvent()
//    let viewModel = ArticleDetailsViewModel(article: event1)
////    let newLink = Link(title: "title", url: "url")
//    let result = viewModel.createLink(string)
//
//  }
  
}
