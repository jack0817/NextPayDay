//
//  Interval+CoreDataProperties.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//
//

import Foundation
import CoreData


extension Interval {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Interval> {
        return NSFetchRequest<Interval>(entityName: "Interval")
    }

    @NSManaged public var value: Int32
    @NSManaged public var parentAccount: Account?

}
