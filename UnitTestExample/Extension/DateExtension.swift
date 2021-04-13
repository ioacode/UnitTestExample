//
//  DateExtension.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 13/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation
import UIKit

enum DateParamenter: String {
    case second = "second"
    case minute = "minute"
    case hour = "hour"
    case day = "day"
    case week = "week"
    case month = "month"
}
extension Date {
    func timeAgoDisplay() -> String {
        let secondAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        
        let quotient: Int
        let unit: DateParamenter
        
        if secondAgo < minute {
            quotient = secondAgo
            unit = .second
        } else if secondAgo < hour {
            quotient = secondAgo / minute
            unit = .minute
        } else if secondAgo < day {
            quotient = secondAgo / hour
            unit = .hour
        } else if secondAgo < week {
            quotient = secondAgo / day
            unit = .day
        } else if  secondAgo < month {
            quotient = secondAgo / week
            unit = .week
        } else {
            quotient = secondAgo / month
            unit = .month
        }
        
        return "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
    }
}
