//
//  PersistentContainer.swift
//  CoreDataFirstExample
//
//  Created by Nikhilkumar Balne on 21/02/21.
//

import Foundation
import CoreData

final class PersistantContainer {
    
    init() {}
    
    static let shared = PersistantContainer()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataFirstExample")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support

    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
