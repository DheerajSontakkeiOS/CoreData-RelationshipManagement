//
//  OneToOneView.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//

import SwiftUI

struct OneToOneView: View {
    
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Person.name, ascending: true)],
        animation: .default)
    private var persons: FetchedResults<Person>
    
    @State private var name = ""
    @State private var city = ""
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("City", text: $city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add") {
                    CoreDataHandler.shared.addPersonWithAddress(name: name, address: city)
                    name = ""
                    city = ""
                }
            }
            .padding()
            
            List {
                ForEach(persons) { person in
                    VStack(alignment: .leading) {
                        Text(person.name ?? "No Name")
                            .font(.headline)
                        Text("City: \(person.address?.city ?? "N/A")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Button("Edit") {
                                CoreDataHandler.shared.updatePersonWithAddress(person: person, name: name, address: city)
                                print("Edit button is tapped!")
                            }
                            
                            Button("Delete") {
                                CoreDataHandler.shared.deletePerson(person: person)
                                print("Delete button is tapped!")
                            }
                            .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
        .navigationTitle("One-to-One")
        .onAppear() {
            print("TODO: Will print Store URL!!!\(PersistenceController.shared.storeURL)")
        }
    }
}

#Preview {
    OneToOneView()
}
