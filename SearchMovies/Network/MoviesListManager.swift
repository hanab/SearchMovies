//
//  MoviesListManager.swift
//  SearchMovies
//
//  Created by Demas, Hana Belete on 9/21/21.
//

import Foundation

typealias RetrieveMoviesHandler = (Movies) -> Void
public typealias ErrorHandler = ((Error?) -> Void)

protocol MoviesManagerProtocol {
    func fetchMovies(searchTerm: String, successHandler: @escaping  RetrieveMoviesHandler, errorHandler: @escaping ErrorHandler)
    func fetchMovies(url: URL,successHandler: @escaping  RetrieveMoviesHandler, errorHandler: @escaping ErrorHandler)
}

let searchAPIKey = "SearchAPIKey"
class MoviesListManager: MoviesManagerProtocol {
    
    //MARK: Properties
    private let session: NetworkSessionProtocol
    private let jsonDecoder: JSONDecoder = JSONDecoder()
    
    //MARK: Init
    init(session: NetworkSessionProtocol) {
        self.session = session
    }
    
    //MARK: Methods
    func fetchMovies(url: URL, successHandler: @escaping  RetrieveMoviesHandler, errorHandler: @escaping ErrorHandler) {
        let request = URLRequest(url: url)
        let task = session.sessionDataTask(with: request, completionHandler:  { (data, response, error) -> Void in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Movies.self, from: data)
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
    
    func fetchMovies(searchTerm: String, successHandler: @escaping  RetrieveMoviesHandler, errorHandler: @escaping ErrorHandler) {
        guard let apiKey = Bundle.main.infoDictionary?[searchAPIKey] as? String else {
            fatalError("Missing string value for \(searchAPIKey) in the info.plist file.")
        }
        let searchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "http://www.omdbapi.com/?apikey=\(apiKey)&s=\(searchTerm)"
        guard let url = URL(string: urlString) else {
            return
        }
        fetchMovies(url: url, successHandler: successHandler, errorHandler: errorHandler)
    }
}
