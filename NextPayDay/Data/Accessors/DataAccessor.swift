//
//  DataAccessor.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//

import Foundation
import CoreData

public class DataAccessor<T: NSManagedObject> {
    
    public var entityName: String {
        return NSStringFromClass(T.self)
    }
    
    var viewContext: NSManagedObjectContext? {
        return DataContext.viewContext
    }
    
    public func count() -> Int {
        do {
            return try viewContext?.count(for: T.fetchRequest()) ?? 0
        } catch {
            return 0
        }
    }
    
    public func new() -> T? {
        guard let context = self.viewContext else { return nil }
        return NSEntityDescription.insertNewObject(forEntityName: self.entityName, into: context) as? T
    }
    
    public func fetchAll(sortedBy: [NSSortDescriptor]? = nil) -> [T] {
        let request = T.fetchRequest()
        if let sortDescriptors = sortedBy {
            request.sortDescriptors = sortDescriptors
        }
        
        do {
            return try  self.viewContext?.fetch(request) as? [T] ?? []
        } catch {
            return []
        }
    }
    
    public func fetchAllAsync(
        sortedBy sortDescriptors: [NSSortDescriptor]? = nil,
        completed: @escaping (([T]) -> Void)
    ) {
        DispatchQueue.global(qos: .background).async {
            let entities = self.fetchAll(sortedBy: sortDescriptors)
            completed(entities)
        }
    }
}
