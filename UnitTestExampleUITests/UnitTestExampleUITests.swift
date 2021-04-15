//
//  UnitTestExampleUITests.swift
//  UnitTestExampleUITests
//
//  Created by ahmad shiddiq on 16/09/20.
//  Copyright © 2020 ahmad shiddiq. All rights reserved.
//

import XCTest

class UnitTestExampleUITests: XCTestCase {

    override class func setUp() {
        XCUIApplication().launch()
    }
    
    func testValidLoginSuccess() {
        var sut: UIViewController!
        var navigationController: UINavigationController!
        
        let validEmail = "hahaha@gmail.com"
        let validPassword = "123456"
        
        let app = XCUIApplication()
        
        let fieldEmail = app.textFields["Email"]
        XCTAssertTrue(fieldEmail.exists)
        fieldEmail.tap()
        fieldEmail.typeText(validEmail)
        
        let fieldPassword = app.textFields["Password"]
        XCTAssertTrue(fieldEmail.exists)
        fieldPassword.tap()
        fieldPassword.typeText(validPassword)
        
        app.buttons["Login"].tap()
        
        let dashBoardView = app.otherElements["ProfileController"]
        let dasbBoardShown = dashBoardView.waitForExistence(timeout: 5)
    
    }
    
    override class func tearDown() {
    }
    
}
