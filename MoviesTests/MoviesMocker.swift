//
//  MoviesMocker.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/26/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

@testable import Movies

class MoviesMocker {
    static func threeMovies() -> [Movie] {
        var movies = [Movie]()
        let movie1 = Movie(id: 1, overview: "overview 1", voteAverage: 3.0, originalTitle: "title 1")
        let movie2 = Movie(id: 2, overview: "overview 2", voteAverage: 4.0, originalTitle: "title 2")
        let movie3 = Movie(id: 3, overview: "overview 3", voteAverage: 5.0, originalTitle: "title 3")
        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)
        return movies
    }

    static func spyMoviesAPIForError() -> SpyMoviesAPI {
        let spyMoviesAPI = SpyMoviesAPI(searchResult: .Error)
        return spyMoviesAPI
    }

    static func spyMoviesAPIForSuccess(movies: [Movie] = MoviesMocker.threeMovies()) -> SpyMoviesAPI {
        let spyMoviesAPI = SpyMoviesAPI(searchResult: .Success(movies))
        return spyMoviesAPI
    }
}
