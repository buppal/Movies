//
//  MoviesService.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/25/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation

protocol MoviesService {
    func performRequest(request: MoviesSearchRequest, completion: @escaping (Response<[Movie], ResponseError>) -> Void)
}
