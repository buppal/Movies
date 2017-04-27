//
//  HomeViewModel.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation

protocol HomeViewControllerPresenter: class {
    func presentTableViewUpdates()
}

class HomeViewModel {
    weak var presenter: HomeViewControllerPresenter?
    private(set) var movies: [Movie]?
    var moviesAPI: MoviesService = MoviesAPI()
    private var moviesCellViewModels: [MoviesTableViewCellViewModel]? {
        didSet {
            presenter?.presentTableViewUpdates()
        }
    }

    private static func createMoviesCellViewModels(movies: [Movie]) -> [MoviesTableViewCellViewModel] {
        return movies.map { return MoviesTableViewCellViewModel(movie: $0) }
    }

    //MARK: Internal Functions

    func moviesCellViewModelCount() -> Int {
        return moviesCellViewModels?.count ?? 0
    }

    func viewModelForCellAtIndex(_ index: Int) -> MoviesTableViewCellViewModel {
        return moviesCellViewModels![index]
    }

    func didSearchForMovie(query: String) {
        let moviesSearchRequest = MoviesSearchRequest(query: query)
        moviesAPI.performRequest(request: moviesSearchRequest) { (response) in
            switch response {
            case .success(let movies):
                self.movies = movies
                self.moviesCellViewModels = HomeViewModel.createMoviesCellViewModels(movies: movies)
            case .failure(let error):
                //Present error alert
                print(error)
            }
        }
    }

    func movieDetailsViewModel(row: Int) -> MovieDetailsViewModel {
        guard let movies = movies else {
            fatalError("We should have movies here.")
        }
        let movieDetailsViewModel = MovieDetailsViewModel(movie: movies[row])
        return movieDetailsViewModel
    }
}
