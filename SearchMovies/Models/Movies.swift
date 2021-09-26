//
//  Movies.swift
//  SearchMovies
//
//  Created by Demas, Hana Belete on 9/21/21.
//
import Foundation

// MARK: - Movies
struct Movies: Codable {
    let search: [SearchMovie]
    let totalResults: String
    let response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - SearchMovie
struct SearchMovie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case game = "game"
    case movie = "movie"
    case series = "series"
}
