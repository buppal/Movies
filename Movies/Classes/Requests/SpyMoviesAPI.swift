//
//  SpyMoviesAPI.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/25/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

@testable import Movies

class SpyMoviesAPI: MoviesService {

    enum SearchResult {
        case Error
        case Success([Movie])
    }

    private let searchResult: SearchResult

    init(searchResult: SearchResult) {
        self.searchResult = searchResult
    }

    func performRequest(request: MoviesSearchRequest, completion: @escaping (Response<[Movie], ResponseError>) -> Void) {
        let response: Response<[Movie], ResponseError>
        switch searchResult {
        case .Error:
            response = .failure(.nilData)
        case .Success(let movies):
            response = .success(movies)
        }
        completion(response)
    }
}
