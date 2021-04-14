//
//  UserProfile.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 14/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation

class UserProfile: Decodable {
    enum UserProfileKey: String, CodingKey {
        case success = "success"
        case data = "data"
        case name = "name"
        case email = "email"
        case phone = "phone"
    }
    
    private let name: String
    private let email: String
    private let phone: String
    
    
    init(_ name: String, email: String, phone: String) {
        self.name = name
        self.email = email
        self.phone = phone
    }
    
    required public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserProfileKey.self)
        let data = try container.nestedContainer(keyedBy: UserProfileKey.self, forKey: .data)
        
        let name = try data.decode(String.self, forKey: .name)
        let email = try data.decode(String.self, forKey: .email)
        let phone = try data.decode(String.self, forKey: .phone)
        
        self.init(name, email: email, phone: phone)
    }

}
