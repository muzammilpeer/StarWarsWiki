//
//  MoviesScreenTests.swift
//  StarsWarsWikiTests
//
//  Created by Salman Raza on 12/02/2021.
//

import XCTest
@testable import StarsWarsWiki

class MoviesScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testMoviesScreenDataSourceFetching() {
        let promise = expectation(description: "Movies screen should show movies list")
        
        let moviesViewModel = MoviesViewModel.init(with: "https://swapi.dev/api/films/")
        
        moviesViewModel.dataSource?.bind { (dataSource) in
            if dataSource.count > 0 {
                promise.fulfill()
            }
        }
        moviesViewModel.fetchData()
        
        wait(for: [promise], timeout: 10)
    }
    
//    func testMoviesScreenDataSourceFetchingWithWrongApi() {
//        let promise = expectation(description: "Wrong api should not return data source")
//        
//        let moviesViewModel = MoviesViewModel.init(with: "https://swapi.dev/api/films/wrong_end_point")
//        
//        moviesViewModel.dataSource?.bind { (dataSource) in
//            if dataSource.count == 0 {
//            }
//            promise.fulfill()
//        }
//        moviesViewModel.fetchData()
//        
//        wait(for: [promise], timeout: 10)
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
