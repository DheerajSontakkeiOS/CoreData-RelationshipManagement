//
//  ContentView.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("One-to-One (Person ↔ Address)", destination: OneToOneView())
                NavigationLink("One-to-Many (Department → Employees)", destination: OneToManyView())
                NavigationLink("Many-to-Many (Student ↔ Course)", destination: ManyToManyView())
            }
            .navigationTitle("Core Data Relationships")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
