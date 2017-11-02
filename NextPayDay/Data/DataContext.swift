//
//  DataContext.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//

import Foundation
import CoreData

public class DataContext {
    
    private static let containerName = "NextPayDay"
    private static let _instance = DataContext()
    
    private var _persistentContainer: NSPersistentContainer?
    private var _viewContext: NSManagedObjectContext? {
        return self._persistentContainer?.viewContext
    }
    private var _managedObjectModel: NSManagedObjectModel? {
        return self._persistentContainer?.managedObjectModel
    }
    
    public static var viewContext: NSManagedObjectContext? {
        return _instance._viewContext
    }
    
    // MARK: Public Static Functions
    
    public static func intializeContext() {
        let container = NSPersistentContainer(name: DataContext.containerName)
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            _instance._persistentContainer = container
        }
    }
    
    public static func entityNames() -> [String] {
        guard let model = _instance._managedObjectModel else { return [] }
        return model.entities.flatMap { $0.name }
    }
    
    public static func save() {
        guard let context = _instance._viewContext, context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
