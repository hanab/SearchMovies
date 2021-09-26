//
//  URLSession+DataTask.swift
//  SearchMovies
//
//  Created by Demas, Hana Belete on 9/21/21.
//

import Foundation

//MARK: Urlsession extension and protocoles used for testing
protocol NetworkSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func sessionDataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSession: NetworkSessionProtocol {
    func sessionDataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
