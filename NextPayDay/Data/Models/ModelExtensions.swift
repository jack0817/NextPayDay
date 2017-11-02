//
//  ModelExtensions.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//

import Foundation
import CoreData

public enum AccountType: Int32 {
    case none = 0
    case monthly = 1
    case weekly = 2
    case semiWeekly = 3
    
    public var description: String {
        switch self {
        case .none: return "None"
        case .monthly: return "Monthly"
        case .weekly: return "Weekly"
        case .semiWeekly: return "Semi-Weekly"
        }
    }
}

extension Account {
    public var accountType: AccountType {
        get { return AccountType(rawValue: self.type)! }
        set { self.type = newValue.rawValue }
    }
}

extension Interval {
    
}
