//
//  CoreDataStack.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private init() {}
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UnsplashApp")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error loadPersistentStores: \(error)")
            }
        }
            return container
        }()
            
    var context: NSManagedObjectContext{
        persistentContainer.viewContext
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let errorDescription = error.localizedDescription
                fatalError("Error saving context: \(errorDescription)")
            }
        }
    }
    }
    

