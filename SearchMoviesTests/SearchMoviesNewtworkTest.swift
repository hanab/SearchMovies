//
//  SearchMoviesNewtworkTest.swift
//  SearchMoviesTests
//
//  Created by Demas, Hana Belete on 9/25/21.
//

@testable import SearchMovies
import XCTest

class SearchMoviesNewtworkTest: XCTestCase {
    
    //MARK: Properties
    var moviesApiClient: MoviesListManager!
    var session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        moviesApiClient = MoviesListManager(session: session)
    }
    
    //MARK: TestCases
    func testDataTaskResumeCalled() {
        let dataTask = MockURLSessionDataTask()
        session.mockDataTask = dataTask
        
        moviesApiClient.fetchMovies(searchTerm: "Titanic", successHandler: { (movies) in
            
        }, errorHandler: { (error) in
            
        })
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func testDataTaskSetSessionUrl() {
        let dataTask = MockURLSessionDataTask()
        session.mockDataTask = dataTask
        
        guard let url = URL(string: "https://myurl") else {
            fatalError("URL can't be empty")
        }
        
        moviesApiClient.fetchMovies(url: url, successHandler: { (movies) in
            
        }, errorHandler: { (error) in
            
        })
        
        XCTAssert((session.mockURL == url))
    }
    
}
