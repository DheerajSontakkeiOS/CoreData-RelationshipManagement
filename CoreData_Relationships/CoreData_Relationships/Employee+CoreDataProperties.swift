//
//  Employee+CoreDataProperties.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var department: Department?

}

extension Employee : Identifiable {

}
