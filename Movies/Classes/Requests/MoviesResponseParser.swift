//
//  MoviesResponseParser.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/26/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

struct MoviesResponseParser {
    private let response: Alamofire.DataResponse<Data>

    init(response: Alamofire.DataResponse<Data>) {
        self.response = response
    }

    func parseResponse() -> Response<[Movie], ResponseError> {
        switch response.result {
        case .success:
            guard let data = response.data else {
                return .failure(.nilData)
            }
            do {
                let moviesResponse: MoviesResponse = try unbox(data: data)
                return .success(moviesResponse.movies)
            } catch let error as UnboxError {
                return .failure(.parseError(error: error.localizedDescription))
            }
            catch {
                return .failure(.parseError(error: Constants.Error.unknownError))
            }
        case .failure:
            return .failure(.networkError)
        }
    }
}

private struct MoviesResponse: Unboxable {
    let movies: [Movie]

    init(unboxer: Unboxer) throws {
        movies = try unboxer.unbox(key: "results")
    }
}
