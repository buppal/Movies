//
//  MoviesAPI.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/25/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

class MoviesAPI: MoviesService {
    func performRequest(request: MoviesSearchRequest, completion: @escaping (Response<[Movie], ResponseError>) -> Void) {
        Alamofire.request(request.url, method: request.httpMethod, parameters: request.requestParams).validate().responseData { (responseData) in
            let responseParser = MoviesResponseParser(response: responseData)
            completion(responseParser.parseResponse())
        }
    }
}
