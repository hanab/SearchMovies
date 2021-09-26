//
//  MovieTest.swift
//  SearchMoviesTests
//
//  Created by Demas, Hana Belete on 9/25/21.
//

@testable import SearchMovies
import XCTest

class MovieTest: XCTestCase {
    
    func testImdbStringToRatingCoversion() {
        let imdbRating = "8.1"
        
        XCTAssertEqual(Movie.getRatingFrom(imdbRating: imdbRating), 4.05)
    }
}
