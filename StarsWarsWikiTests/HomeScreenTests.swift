//
//  HomeScreenTests.swift
//  StarsWarsWikiTests
//
//  Created by Salman Raza on 12/02/2021.
//

import XCTest
@testable import StarsWarsWiki

class HomeScreenTests: XCTestCase {

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
    
    func testHomeScreenDataSourceFetching() {
        let promise = expectation(description: "Home screen should show options")
        
        let homeViewModel = HomeViewModel.init()
        homeViewModel.fetchData()

        homeViewModel.dataSource?.bind { (dataSource) in
            XCTAssertTrue(dataSource.count > 0, "Test passed")
            if dataSource.count <= 0 {
                XCTFail("Test case failed")
            }
//            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
