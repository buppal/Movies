//
//  SpyRequest.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/25/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

@testable import Movies
import Alamofire


class SpyRequest : Requestable {

    var requestURLPath: String
    let httpMethod = Alamofire.HTTPMethod.post

    var requestParams = [String : String]()

    // MARK: - Initilizers

    init(path: String) {
        requestURLPath = path
    }
}
