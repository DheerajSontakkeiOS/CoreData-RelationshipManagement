# CoreData-RelationshipManagement
This repository is a minimal, copy-pasteable SwiftUI + Core Data Xcode project demonstrating **Relationship Management** in Core Data (One-to-One, One-to-Many, Many-to-Many). It includes:

- Persistence setup (NSPersistentContainer)
- Model description and setup instructions (you'll create the .xcdatamodeld in Xcode)
- SwiftUI Views with CRUD operations to exercise relationships
- Helper functions and examples

---

## Project Structure (files provided below)

- README.md (this file)
- Persistence.swift
- CoreDataModel.md (instructions for creating the model in Xcode)
- CoreData+Entities.swift (optional convenience extensions)
- CoreDataRelationshipsApp.swift
- ContentView.swift
- OneToOneView.swift
- OneToManyView.swift
- ManyToManyView.swift

---

## CoreDataModel.md (instructions)

Create a Data Model named `CoreData_Relationships` in Xcode (.xcdatamodeld) and add the following entities and relationships:

1) **Person**
- Attributes: name (String)
- Relationships: address (to Address, to-one, inverse = person)

2) **Address**
- Attributes: city (String)
- Relationships: person (to Person, to-one, inverse = address)

3) **Department**
- Attributes: name (String)
- Relationships: employees (to Employee, to-many, inverse = department)

4) **Employee**
- Attributes: fullName (String)
- Relationships: department (to Department, to-one, inverse = employees)

5) **Student**
- Attributes: name (String)
- Relationships: courses (to Course, to-many, inverse = students)

6) **Course**
- Attributes: title (String)
- Relationships: students (to Student, to-many, inverse = courses)

Notes:
- For to-many relationships, set the type to `To Many` and check `Ordered` = false (default).
- Leave attributes optional for simplicity.
- Use the default Codegen = Class Definition (or choose Manual/Category if you prefer hand-written classes).

---
