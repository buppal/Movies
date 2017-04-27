//
//  MoviesSearchRequest.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/20/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

struct MoviesSearchRequest: Requestable {
    let requestURLPath = "search/movie"
    let httpMethod = Alamofire.HTTPMethod.post

    var requestParams = [String : String]()

    // MARK: - Initilizers

    init(query: String) {
        requestParams = defaultParams
        setParam(params: &requestParams, key: "query", value: query)
    }
}
