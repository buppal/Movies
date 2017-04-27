//
//  MoviesTableViewCellViewModelTests.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import XCTest

@testable import Movies

class MoviesTableViewCellViewModelTests: XCTestCase {
    func testTitleIsCorrect() {
        let controlMovie = Movie(id: 1, overview: "Test movie overview", voteAverage: 2.0, originalTitle: "Test movie title")
        let viewModel = MoviesTableViewCellViewModel(movie: controlMovie)
        XCTAssertEqual(viewModel.title, "Test movie title")
    }

    func testOverviewIsCorrect() {
        let controlMovie = Movie(id: 1, overview: "Test movie overview", voteAverage: 2.0, originalTitle: "Test movie title")
        let viewModel = MoviesTableViewCellViewModel(movie: controlMovie)
        XCTAssertEqual(viewModel.overview, "Test movie overview")
    }

    func testVoteAverageIsCorrect() {
        let controlMovie = Movie(id: 1, overview: "Test movie overview", voteAverage: 2.0, originalTitle: "Test movie title")
        let viewModel = MoviesTableViewCellViewModel(movie: controlMovie)
        XCTAssertEqual(viewModel.voteAverage, "2.0")
    }
}
