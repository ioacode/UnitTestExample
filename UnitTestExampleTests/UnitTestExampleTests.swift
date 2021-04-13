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
    
    //MARK: - Testing nil data
    func testNilData() {
        var helloWord: String?
        
        //check data is nil
        XCTAssertNil(helloWord)
        
        helloWord = "testing data"
        // check data with valid parametes
        XCTAssertEqual(helloWord, "testing data")
    }
    
    //MARK: - Validation BASEURL
    func testValidationURL() {
        let global: GlobalVariable = GlobalVariable()
        let urlTesting = "https://ojokturusore.com"
        XCTAssertTrue(global.BASEURL == urlTesting, "BASEURL equality test failed, \(global.BASEURL) != \(urlTesting)")
        XCTAssertEqual( global.BASEURL, urlTesting,
                    "String equality test failed, \(global.BASEURL) != \(urlTesting)" )
    }
    
    //MARK: - Haters start nicely
    func testHaterStartsNicely() {
        let hater = Hater()
        XCTAssertFalse(hater.hating, "New Haters should not be hating.")
    }
    
    //MARK: - contact model
    func testContactModel() {
        var list = [Contact]()
        
        var contact = Contact()
        contact.name = "Anton samba"
        contact.email = "antonsamba@gmail.com"
        
        // make sure that the list doesn't contain the contact
        // initially (to avoid persistence-based flakiness)
        XCTAssertFalse(list.contains(where: { $0.name == contact.name}))
        
        // Add the contact to the list, and verify that its
        // contains API currecly return 'true'
        list.append(contact)
        XCTAssertTrue(list.contains(where: { $0.name == contact.name}), "data not success append to the list")
    }
    
    //MARK: - Compare 2 List data
    func testBookData() {
        var library = [Book]()
        
        let books = [
            Book(id: 1, name: "John", genre: .male),
            Book(id: 2, name: "Surty", genre: .female)
        ]
        
        library = books
        XCTAssertEqual( library, books, "String equality test failed")
    }
    
}
