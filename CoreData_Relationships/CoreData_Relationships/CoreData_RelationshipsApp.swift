//
//  CoreData_RelationshipsApp.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//

import SwiftUI

@main
struct CoreData_RelationshipsApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
