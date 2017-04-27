//
//  MoviesViewModelTests.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import XCTest
@testable import Movies

class MovieDetailsViewModelTests: XCTestCase {
    func testOverviewTextIsCorrect() {
        let controlMovie = Movie(id: 1, overview: "Test movie overview", voteAverage: 2.0, originalTitle: "Test movie title")
        let viewModel = MovieDetailsViewModel(movie: controlMovie)
        XCTAssertEqual(viewModel.overviewText, "Test movie overview")
    }

    func testNavigationTitleTextIsCorrect() {
        let controlMovie = Movie(id: 1, overview: "Test movie overview", voteAverage: 2.0, originalTitle: "Test movie title")
        let viewModel = MovieDetailsViewModel(movie: controlMovie)
        XCTAssertEqual(viewModel.navigationTitleText, "Test movie title")
    }
}
