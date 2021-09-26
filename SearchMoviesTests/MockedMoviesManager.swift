//
//  MockedMoviesManager.swift
//  SearchMoviesTests
//
//  Created by Demas, Hana Belete on 9/25/21.
//

import Foundation
@testable import SearchMovies

class MockedMoviesManager:  MoviesManagerProtocol {
    
    //MARK: Properties
    var fetchCalled = false
    var overideMovies: Movies?
    var overrideError: Error?
    
    //MARK: Methods
    func fetchMovies(searchTerm: String, successHandler: @escaping  RetrieveMoviesHandler, errorHandler: @escaping ErrorHandler) {
        if let overideMovies = self.overideMovies {
            successHandler(overideMovies)
        } else {
            errorHandler(overrideError)
        }
    }
    func fetchMovies(url: URL,successHandler: @escaping  RetrieveMoviesHandler, errorHandler: @escaping ErrorHandler) {
        fetchCalled = true
    }
}
