//
//  MoviesResponseParserTests.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/26/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import XCTest
import Alamofire
@testable import Movies

class MoviesResponseParserTests: XCTestCase {
    func testMoviesAreParsedCorrectlyForValidResponse() {
        let data = loadJSONFile(name: "MoviesSuccess")
        let dataResponse = Alamofire.DataResponse(request: nil, response: nil, data: data, result: Result.success(data))
        let parser = MoviesResponseParser(response: dataResponse)

        let parsedResponse = parser.parseResponse()
        let knownMoviesResponseCount = 2
        switch parsedResponse {
        case let .success(movies):
            XCTAssertEqual(movies.count, knownMoviesResponseCount)
        case .failure:
            XCTFail("It should return a Success with \(parsedResponse) movies")

        }
    }

    func testMoviesAreParsedCorrectlyForNilResponse() {
        let dataResponse = Alamofire.DataResponse(request: nil, response: nil, data: nil, result: Result.success(Data()))
        let parser = MoviesResponseParser(response: dataResponse)

        let parsedResponse = parser.parseResponse()
        switch parsedResponse {
        case .success:
            XCTFail("It should return a FAILURE")
        case let .failure(error):
            XCTAssertEqual(error, .nilData)
        }
    }

    //Not implemented

    func testMoviesParsedCorrectlyForFailure() {

    }

    func testMoviesParsedCorrectlyForParseError() {

    }
}
