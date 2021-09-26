//
//  JsonParsingTest.swift
//  SearchMoviesTests
//
//  Created by Demas, Hana Belete on 9/25/21.
//

import XCTest
@testable import SearchMovies

class JsonParsingTest: XCTestCase {
    
   //MARK: setup methodes
    override func setUp() {
        super.setUp()
    }
       
       //MARK: TestCases
    func testJsonParing() {
        let testExpectation =  expectation(description: "fetch movies expectation")
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "valid", withExtension: "json") else {
            XCTFail("Missing file: valid.json")
            return
        }
        
        let parser = MoviesListManager(session:URLSession.shared)
        parser.fetchMovies(url: url, successHandler: { (movies) in
            XCTAssertEqual(movies.search.count, 10)
            XCTAssertEqual(movies.response, "True")
            XCTAssertEqual(movies.totalResults, "67")
            testExpectation.fulfill()
        }, errorHandler: { (error) in
            XCTFail("Did not expect any errors, but received error = \(error.debugDescription)")
            testExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
