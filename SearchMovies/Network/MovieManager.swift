//
//  MovieManager.swift
//  SearchMovies
//
//  Created by Demas, Hana Belete on 9/24/21.
//

import Foundation

typealias RetrieveMovieHandler = (Movie) -> Void

protocol MovieManagerProtocol {
    func fetchMovieWith(imdbId: String, successHandler: @escaping  RetrieveMovieHandler, errorHandler: @escaping ErrorHandler)
    func fetchMovie(url: URL, successHandler: @escaping  RetrieveMovieHandler, errorHandler: @escaping ErrorHandler)
}

class MovieManager: MovieManagerProtocol {
    
    //MARK: Properties
    private let session: NetworkSessionProtocol
    private let jsonDecoder: JSONDecoder = JSONDecoder()
    
    //MARK: Init
    init(session: NetworkSessionProtocol) {
        self.session = session
    }
    
    //MARK: Methods
    func fetchMovie(url: URL, successHandler: @escaping  RetrieveMovieHandler, errorHandler: @escaping ErrorHandler) {
        let request = URLRequest(url: url)
        let task = session.sessionDataTask(with: request, completionHandler:  { (data, response, error) -> Void in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Movie.self, from: data)
                    successHandler(decodedResponse)
                } catch {
                    errorHandler(error)
               }
            } else {
                errorHandler(error)
            }
        })
        task.resume()
    }
    
    func fetchMovieWith(imdbId: String, successHandler: @escaping  RetrieveMovieHandler, errorHandler: @escaping ErrorHandler) {
        guard let apiKey = Bundle.main.infoDictionary?[searchAPIKey] as? String else {
            fatalError("Missing string value for \(searchAPIKey) in the info.plist file.")
        }
        let urlString = "http://www.omdbapi.com/?apikey=\(apiKey)&i=\(imdbId)"
        guard let url = URL(string: urlString) else {
            return
        }
        fetchMovie(url: url, successHandler: successHandler, errorHandler: errorHandler)
    }
}

