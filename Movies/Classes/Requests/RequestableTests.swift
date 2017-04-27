//
//  RequestableTests.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/20/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import XCTest
@testable import Movies

class RequestableTests: XCTestCase {
    func testURLIsCorrect() {
        let spyRequest = SpyRequest(path: "my/custom/path")
        XCTAssertEqual(spyRequest.url, "https://api.themoviedb.org/3/my/custom/path")
    }

    func testDefaultParamsAreCorrect() {
        let spyRequest = SpyRequest(path: "my/custom/path")
        XCTAssertEqual(spyRequest.defaultParams, ["api_key": "f7033f19ef33558f1981751f0a24cd73"])
    }
}

