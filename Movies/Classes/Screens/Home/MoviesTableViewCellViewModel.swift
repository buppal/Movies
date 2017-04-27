//
//  MoviesTableViewCellViewModel.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation

struct MoviesTableViewCellViewModel: Equatable {
    let title: String
    let overview: String
    let voteAverage: String
    let releaseDate: String
    
    init(movie: Movie) {
        title = movie.originalTitle
        overview = movie.overview
        voteAverage = String(movie.voteAverage)
        releaseDate = "2012-02-03"
    }
}

func == (lhs: MoviesTableViewCellViewModel, rhs: MoviesTableViewCellViewModel) -> Bool {
    return lhs.overview == rhs.overview &&
            lhs.title == rhs.title &&
            lhs.voteAverage == rhs.voteAverage
}
