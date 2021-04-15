//
//  UserDefault.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 14/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation

enum TypeUserDefault: String {
    case name = "Name"
    case number = "number"
}

protocol UserDefaultProtocol {
    func setName(_ value: Any, forKey defaultName: TypeUserDefault)
    func getNumber() -> Int
    func setNumber(_ value: Any, forKey defaultName: TypeUserDefault)
}

extension UserDefaults: UserDefaultProtocol {
    func getNumber() -> Int {
        return 0
    }
    func setName(_ value: Any, forKey defaultName: TypeUserDefault) {
    }
    func setNumber(_ value: Any, forKey defaultName: TypeUserDefault) {
    }
}
 
class dataUserDefault {
    var userSetup: UserDefaultProtocol = UserDefaults.standard
    
    func savingUsername(with nameValue: String, forKey defaultName: TypeUserDefault) {
        userSetup.setName(nameValue, forKey: TypeUserDefault(rawValue: defaultName.rawValue)!)
    }
    
    func savingNumber(with numberValue: Int, forKey defaultName: TypeUserDefault) {
        let count = userSetup.getNumber()
        userSetup.setNumber(count + numberValue, forKey: TypeUserDefault(rawValue: defaultName.rawValue)!)
    }
}
