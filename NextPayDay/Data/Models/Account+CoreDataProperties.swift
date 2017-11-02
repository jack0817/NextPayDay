//
//  Account+CoreDataProperties.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: Int32
    @NSManaged public var createdDate: NSDate?
    @NSManaged public var intervals: NSSet?

}

// MARK: Generated accessors for intervals
extension Account {

    @objc(addIntervalsObject:)
    @NSManaged public func addToIntervals(_ value: Interval)

    @objc(removeIntervalsObject:)
    @NSManaged public func removeFromIntervals(_ value: Interval)

    @objc(addIntervals:)
    @NSManaged public func addToIntervals(_ values: NSSet)

    @objc(removeIntervals:)
    @NSManaged public func removeFromIntervals(_ values: NSSet)

}
