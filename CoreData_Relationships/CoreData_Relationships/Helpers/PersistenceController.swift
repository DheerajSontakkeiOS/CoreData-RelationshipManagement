//
//  PersistenceController.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//

import Foundation
import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreData_Relationships")
        persistentContainer.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("Error in loading container: \(error)")
            }
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var storeURL: String {
        return (persistentContainer.persistentStoreCoordinator.persistentStores.first?.url)?.absoluteString ?? ""
    }
    
}
