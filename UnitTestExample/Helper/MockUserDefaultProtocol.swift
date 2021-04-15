//
//  MockUserDefaultProtocol.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 14/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation

class MockUserDefaultProtocol: UserDefaultProtocol {
    var defaultKey: TypeUserDefault?
    var nameValue: String?
    var numberValue: Int?
    
    
    func getNumber() -> Int {
        return numberValue ?? 0
    }
    
    func setName(_ value: Any, forKey defaultName: TypeUserDefault) {
        defaultKey = defaultName
        nameValue = value as? String
    }
    
    func setNumber(_ value: Any, forKey defaultName: TypeUserDefault) {
        defaultKey = defaultName
        numberValue = value as? Int
    }
    
    
}
