//
//  MobileNocTests.swift
//  MobileNocTests
//
//  Created by prog_zidane on 9/8/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import XCTest
@testable import MobileNoc

class MobileNocTests: XCTestCase {

    private var presenter: HomeVCPresenter!

    private var contents:[Content]!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.presenter = HomeVCPresenter(view: self)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.presenter = nil
        self.contents = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testFetchData() {
        
        let expectation = XCTestExpectation(description: "Test calcuation is successfully completed.")
        presenter.toggleLoading(isLoading: true)
        
        presenter.homeInteractor.getHomeContent(success: { (contents) in
            
            self.presenter.toggleLoading(isLoading: false)
            
            self.contents = contents
            
            expectation.fulfill()
            
            self.presenter.updateFetchedData()
            
        }) { (msg) in
            self.presenter.showError(errorMsg: msg)
        }
        
        // Wait until the expectation is fulfilled, with a timeout
        // If Expectation is fullfilled before 2.0 secs already, the the control goes to the next step immediatly
        
        wait(for: [expectation], timeout: 10.0)
        
        //Then
        
        print("Test completed.")
    }

}

extension MobileNocTests : ContentsView {
    
    func isLoading(_ isLoading: Bool) {
        if isLoading {
            XCTAssertTrue(isLoading)
            return
        }
        XCTAssertFalse(isLoading)
    }
    
    func updatefetchedData() {
        
        XCTAssertNotNil(self.contents)
        
    }
    
    func didFinishedWithError(msg: String) {
        XCTAssertFalse(msg == "")
    }
    
    
}
