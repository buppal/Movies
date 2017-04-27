//
//  MoviesSearchRequestTests.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/20/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import XCTest
@testable import Movies
import Alamofire

class MoviesSearchRequestTests: XCTestCase {
    func testRequestURLIsCorrect() {
        let movieSearchRequest = MoviesSearchRequest(query: "testQuery")
        XCTAssertEqual(movieSearchRequest.requestURLPath, "search/movie")
    }

    func testRequestMethodIsPost() {
        let movieSearchRequest = MoviesSearchRequest(query: "testQuery")
        XCTAssertEqual(movieSearchRequest.httpMethod, Alamofire.HTTPMethod.post)
    }

    func testRequestParamsAreCorrect() {
        let movieSearchRequest = MoviesSearchRequest(query: "testQuery")
        XCTAssertEqual(movieSearchRequest.requestParams, ["api_key": "f7033f19ef33558f1981751f0a24cd73",
                                                          "query": "testQuery"])
    }
}
