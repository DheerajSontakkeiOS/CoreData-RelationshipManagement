//
//  CoreData+Entities.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//

import Foundation
import CoreData

//convenience fetch request and helpers
extension Person {
    static func fetchRequestAllSorted() -> NSFetchRequest<Person> {
        let request = Person.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Person.name, ascending: true)]
        return request
    }
}

extension Department {
    var employeesArray: [Employee] {
        let set = employees as? Set<Employee> ?? []
        return set.sorted { ($0.fullName ?? "") < ($1.fullName ?? "") }
    }
}

extension Course {
    var studentsArray: [Student] {
        let set = students as? Set<Student> ?? []
        return set.sorted { ($0.name ?? "") < ($1.name ?? "") }
    }
}

extension Student {
    var courseArray: [Course] {
        let set = courses as? Set<Course> ?? []
        return set.sorted { ($0.title ?? "") < ($1.title ?? "") }
    }
}


