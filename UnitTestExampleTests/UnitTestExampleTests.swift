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
    
    //MARK: - Testing function with XCTAssertEqual
    func testTimeAgoStrings() {
        let fiveMinuteAgo = Date(timeIntervalSinceNow: -5 * 60)
        let fiveMinuteAgoDisplay = fiveMinuteAgo.timeAgoDisplay()
        
        XCTAssertEqual(fiveMinuteAgoDisplay, "5 minutes ago")
    }
}
