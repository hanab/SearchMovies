//
//  MoviesViewControllerTest.swift
//  SearchMoviesTests
//
//  Created by Demas, Hana Belete on 9/25/21.
//

@testable import SearchMovies
import XCTest

class MoviesViewControllerTest: XCTestCase {
    
    // MARK: - Object Under Test
    private var manager: MockedMoviesManager!
    private var movieViewController: MoviesViewController!

    // MARK: - Shared Setup/Teardown
    override func setUp() {
        manager = MockedMoviesManager()
        movieViewController = MoviesViewController.vc(moviesManager: manager)
        movieViewController.loadView()
    }
    
    func testTableViewVisibleAndWarnigLabelHidden() {
        manager.overideMovies = Movies(search: [SearchMovie(title: "Bad Boys: Miami Takedown", year: "2004", imdbID: "tt1233516", type: .game, poster: "N/A")], totalResults: "12", response: "True")
        self.movieViewController.searchBarSearchButtonClicked(self.movieViewController.searchBar)
        
        
        let expectation = expectation(description: "fetch movies expectation")
        DispatchQueue.main.async {
            XCTAssertEqual(self.movieViewController.moviesTableView.isHidden, false)
            XCTAssertEqual(self.movieViewController.noResultsLabel.isHidden, true)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testTableViewHiddenAndWarnigLabelVisible() {
        manager.overideMovies = nil
        movieViewController.searchBarSearchButtonClicked(self.movieViewController.searchBar)
        
        let expectation = expectation(description: "fetch movies expectation")
        DispatchQueue.main.async {
            XCTAssertEqual(self.movieViewController.moviesTableView.isHidden, true)
            XCTAssertEqual(self.movieViewController.noResultsLabel.isHidden, false)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 4, handler: nil)
    }
}
