//
//  CoreDataHandler.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 27/11/25.
//

import Foundation
import CoreData

class CoreDataHandler {
    
    static let shared = CoreDataHandler()
    
    private var context: NSManagedObjectContext
    
    private init() {
        self.context = PersistenceController.shared.viewContext
    }
    
    func addPersonWithAddress(name: String, address: String) {
        let p = Person(context: context)
        p.name = name
        
        let a = Address(context: context)
        a.city = address
        
        //setting both the sides is very important
        p.address = a
        //a.person = p//now not setting relationship as it is inversely connected
        
        save()
    }
    
    func updatePersonWithAddress(person: Person, name: String, address: String) {
        let newName = "\(person.name ?? "") updated"
        person.name = newName
        person.address?.city = "\(person.address?.city ?? "") updated"
        save()
    }
    
    func deletePerson(person: Person) {
        context.delete(person)
        save()
    }
    
    func fetchPersonsWithNameAndAddress() -> [Person] {
        let fetchRequest = Person.fetchRequest()
        return try! context.fetch(fetchRequest)
    }
    
    func createDept(deptName: String) {
        let dept = Department(context: context)
        dept.name = deptName
        save()
    }
    
    func addEmployeeToDept(employeeName: String, selectedDepartment: Department) {
        let employee = Employee(context: context)
        employee.fullName = employeeName
        
        employee.department = selectedDepartment
        
        save()
    }
    
    func deleteEmployee(employee: Employee) {
        context.delete(employee)
        save()
    }
    
    func createStudent(studentName: String) {
        let student = Student(context: context)
        student.name = studentName
        save()
    }
    
    func createCourse(courseName: String) {
        let course = Course(context: context)
        course.title = courseName
        save()
    }
    
    func enrollStudentWithCourse(course: Course) {
        let student = Student(context: context)
        student.addToCourses(course)
        save()
    }

    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            }catch {
                print("Saving failed with error: \(error)")
            }
        }
    }
    
    
}
