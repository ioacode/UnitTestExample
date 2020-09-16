//
//  UnitTestExampleTests.swift
//  UnitTestExampleTests
//
//  Created by ahmad shiddiq on 16/09/20.
//  Copyright © 2020 ahmad shiddiq. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class UnitTestExampleTests: XCTestCase {
    func testHelloWorld(){
        var helloworld: String?
        XCTAssertNil(helloworld)
        
        helloworld = "Hello World!"
        XCTAssertEqual(helloworld, "Hello World!")
    }
}
