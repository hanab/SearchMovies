//
//  CosmoViewLoadRating.swift
//  SearchMovies
//
//  Created by Demas, Hana Belete on 9/25/21.
//

import Foundation
import Cosmos

extension CosmosView {
    
    func loadRatingWith(imdbID: String) {
        let apiGateWay = MovieManager(session: URLSession.shared)
        apiGateWay.fetchMovieWith(imdbId: imdbID, successHandler: { (movie: Movie) in
            DispatchQueue.main.async {
                self.rating = Movie.getRatingFrom(imdbRating: movie.imdbRating)
            }
        }, errorHandler: { (error) in
            print(error?.localizedDescription ?? "")
        })
    }
}
