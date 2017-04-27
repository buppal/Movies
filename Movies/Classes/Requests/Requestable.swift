//
//  Requestable.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/20/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import Foundation
import Alamofire

protocol Requestable {
    var requestURLPath: String { get }
    var httpMethod: Alamofire.HTTPMethod { get }
    var parameterEncoding: Alamofire.ParameterEncoding { get }
    var url: String { get }
    var defaultParams: [String: String] { get }
}

extension Requestable {
    var defaultParams: [String: String] {
        var params = [String: String]()
        self.setParam(params: &params, key: "api_key", value: "f7033f19ef33558f1981751f0a24cd73")
        return params
    }

    var url: String {
        return endpoint + requestURLPath
    }

    var endpoint: String {
        return "https://api.themoviedb.org/3/"
    }

    var parameterEncoding: Alamofire.ParameterEncoding {
        return JSONEncoding.default
    }
}

extension Requestable {
    func setParam(params: inout [String: String], key: String, value: String) {
        params[key] = value
    }
}

enum ResponseError: Error, Equatable {
    case networkError
    case serializationError
    case parseError(error: String)
    case cacheError
    case nilData
}

enum Response<T, ResponseError: Error> {
    case success(T)
    case failure(ResponseError)
}

func == (lhs: ResponseError, rhs: ResponseError) -> Bool {
    switch (lhs, rhs) {
    case (.networkError, .networkError):
        return true
    case (.serializationError, .serializationError):
        return true
    case (let .parseError(error1), let .parseError(error2)):
        return error1 == error2
    case (.nilData, .nilData):
        return true
    default:
        return false
    }
}
