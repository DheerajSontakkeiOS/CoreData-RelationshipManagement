//
//  Person+CoreDataProperties.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: Address?

}

extension Person : Identifiable {

}
