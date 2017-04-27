//
//  XCTestCaseExtensions.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/26/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import XCTest

extension XCTestCase {
    func loadJSONFile(name: String, file: StaticString = #file, line: UInt = #line) -> Data {
        guard let filePath = Bundle(for: type(of: self)).path(forResource: name, ofType: "json") else {
            XCTFail("Unable to load JSON file: \(name)", file: file, line: line)
            return Data()
        }
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .alwaysMapped)
        return data
    }
}
