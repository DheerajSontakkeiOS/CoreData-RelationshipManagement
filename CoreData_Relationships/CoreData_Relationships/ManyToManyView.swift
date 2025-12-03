//
//  ManyToManyView.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 03/12/25.
//

import SwiftUI

struct ManyToManyView: View {
    
    @State private var studentName = ""
    @State private var courseName = ""
    
    @State private var selectedStudent: Student?
    @State private var selectedCourse: Course?
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) private var students: FetchedResults<Student>
    
    @FetchRequest(entity: Course.entity(), sortDescriptors: []) private var courses: FetchedResults<Course>
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("Student", text: $studentName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Create") {
                    CoreDataHandler.shared.createStudent(studentName: studentName)
                }
            }
            .padding()
            
            HStack {
                TextField("Course", text: $courseName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Create") {
                    CoreDataHandler.shared.createCourse(courseName: courseName)
                }
            }
            .padding()
            
            HStack {
                Picker("Student", selection: $selectedStudent) {
                    Text("Select").tag(Student?.none)
                    ForEach(students, id: \ .self) { s in
                        Text(s.name ?? "").tag(Optional(s))
                    }
                }
                Picker("Course", selection: $selectedCourse) {
                    Text("Select").tag(Course?.none)
                    ForEach(courses, id: \ .self) { c in
                        Text(c.title ?? "").tag(Optional(c))
                    }
                }
                Button("Enroll") {
                    if let selectedCourse = selectedCourse {
                        CoreDataHandler.shared.enrollStudentWithCourse(course: selectedCourse)
                    }
                }
                .disabled(selectedStudent == nil || selectedCourse == nil)
            }
            .padding()
            
            List {
                Section(header: Text("Students")) {
                    ForEach(students, id: \ .self) { s in
                        VStack(alignment: .leading) {
                            Text(s.name ?? "")
                            Text("Courses: \(s.courseArray.map { $0.title ?? "" }.joined(separator: ", "))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section(header: Text("Courses")) {
                    ForEach(courses, id: \ .self) { c in
                        VStack(alignment: .leading) {
                            Text(c.title ?? "")
                            Text("Students: \(c.studentsArray.map { $0.name ?? "" }.joined(separator: ", "))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
            }
        }
        .onAppear() {
            print("TODO: Will print Store URL!!!\(PersistenceController.shared.storeURL)")
        }
    }
}

#Preview {
    ManyToManyView()
}
