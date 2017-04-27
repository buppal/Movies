//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation

struct MovieDetailsViewModel: Equatable {
    let overviewText: String
    let navigationTitleText: String

    init(movie: Movie) {
        overviewText = movie.overview
        navigationTitleText = movie.originalTitle
    }
}

func == (lhs: MovieDetailsViewModel, rhs: MovieDetailsViewModel) -> Bool {
    return lhs.navigationTitleText == rhs.navigationTitleText &&
            lhs.overviewText == rhs.overviewText
}
