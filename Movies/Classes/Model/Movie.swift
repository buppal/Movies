//
//  Movie.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/20/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation
import Unbox

struct Movie {
    let id: Int
    let overview: String
    let voteAverage: Double
    let originalTitle: String
//    let posterPath: String
}

extension Movie: Unboxable {
    init(unboxer: Unboxer) throws {
        id = try unboxer.unbox(key: "id")
        overview = try unboxer.unbox(key: "overview")
        voteAverage = try unboxer.unbox(key: "vote_average")
        originalTitle = try unboxer.unbox(key: "original_title")
//        posterPath = try unboxer.unbox(key: "poster_path")
    }
}
