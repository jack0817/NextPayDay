//
//  AccountAccessor.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//

import Foundation
import CoreData

public enum AccountProperty {
    case name
    case type
    case createdDate
    case intervals
    
    public var name: String {
        switch self {
        case .name: return "name"
        case .type: return "type"
        case .createdDate: return "createdDate"
        case .intervals: return "intervals"
        }
    }
    
    public func sortDescriptor(ascending: Bool) -> NSSortDescriptor {
        return NSSortDescriptor(key: self.name, ascending: ascending)
    }
}

public typealias AccountSortDescriptor = (AccountProperty, Bool)

public class AccountAccessor: DataAccessor<Account> {
}
