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
    
    //MARK: - Testing Networking
    func testNetworking() {
        let foodReviewApiClient = FoodReviewApiClient()
        let expectatiton = self.expectation(description: "Login Response Parse Expectation")
        
        foodReviewApiClient.login("hahaha@gmail.com", password: "123456") { json, error in
            
            XCTAssertNil(error)
            guard let json = json else {
                XCTFail()
                return
            }
            
            do {
                let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
                let userprofile = try JSONDecoder().decode(UserProfile.self, from: jsonData)
                XCTAssertNotNil(userprofile)
                expectatiton.fulfill()
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    
    //MARK: - Testing User Default
    func testIncreaseCountingShouldIncreaseValueBy1() {
        let setupData = dataUserDefault()
        let userDefaults = MockUserDefaultProtocol()
        setupData.userSetup = userDefaults
        
        // testing save data string
        setupData.savingUsername(with: "anton samba", forKey: .name)
        XCTAssertNotNil(userDefaults.nameValue, "Data is nil")
        XCTAssertEqual(userDefaults.nameValue, "anton samba")
        
        // testing save data Integer
        userDefaults.numberValue = 3
        setupData.savingNumber(with: 2, forKey: .number)
        XCTAssertNotNil(userDefaults.numberValue, "Data is nil")
        XCTAssertEqual(userDefaults.numberValue, 5)
        
    }
}
