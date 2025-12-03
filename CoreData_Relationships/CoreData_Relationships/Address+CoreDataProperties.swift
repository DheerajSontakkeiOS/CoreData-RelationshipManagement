//
//  Address+CoreDataProperties.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?
    @NSManaged public var person: Person?

}

extension Address : Identifiable {

}
