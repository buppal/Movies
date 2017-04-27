//
//  HomeViewModelTests.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import XCTest
@testable import Movies

class HomeViewModelTests: XCTestCase {
    func testMoviesCellViewModelCountIsCorrect() {
        let viewModel = moviesSuccessViewModel()
        viewModel.didSearchForMovie(query: "testQuery")
        XCTAssertEqual(viewModel.moviesCellViewModelCount(), 3)
    }

    func testMovieCellViewModelIsReturnedCorrectlyForRow() {
        let viewModel = moviesSuccessViewModel()
        viewModel.didSearchForMovie(query: "testQuery")
        XCTAssertEqual(viewModel.viewModelForCellAtIndex(0), MoviesTableViewCellViewModel(movie: MoviesMocker.threeMovies()[0]))
        XCTAssertEqual(viewModel.viewModelForCellAtIndex(1), MoviesTableViewCellViewModel(movie: MoviesMocker.threeMovies()[1]))
        XCTAssertEqual(viewModel.viewModelForCellAtIndex(2), MoviesTableViewCellViewModel(movie: MoviesMocker.threeMovies()[2]))
    }

    func testMovieDetailsViewModelIsReturnedCorrectlyForRow() {
        let viewModel = moviesSuccessViewModel()
        viewModel.didSearchForMovie(query: "testQuery")
        XCTAssertEqual(viewModel.movieDetailsViewModel(row: 0), MovieDetailsViewModel(movie: MoviesMocker.threeMovies()[0]))
        XCTAssertEqual(viewModel.movieDetailsViewModel(row: 1), MovieDetailsViewModel(movie: MoviesMocker.threeMovies()[1]))
        XCTAssertEqual(viewModel.movieDetailsViewModel(row: 2), MovieDetailsViewModel(movie: MoviesMocker.threeMovies()[2]))
    }

    // Not Implemented
    func testErrorAlertIsPresentedForAPIError() {

    }
    
}

private extension HomeViewModelTests {
     func moviesSuccessViewModel() -> HomeViewModel {
        let viewModel = HomeViewModel()
        let spyMoviesAPI = MoviesMocker.spyMoviesAPIForSuccess()
        viewModel.moviesAPI = spyMoviesAPI
        return viewModel
    }
}
