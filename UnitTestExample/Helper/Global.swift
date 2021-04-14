//
//  Global.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 13/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation

class GlobalVariable {
    var BASEURL = "https://ojokturusore.com"
    var BASEURLPROFILE = "https://testURL.com/user"
}

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = false
    }
    
    mutating func hasAGoodDay() {
        hating = true
    }
}

