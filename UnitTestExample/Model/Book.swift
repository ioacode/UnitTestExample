//
//  Book.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 13/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation
import UIKit

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

struct Book: Equatable {
    var id: Int?
    var name: String?
    var genre: Gender?
}
