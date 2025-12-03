//
//  OneToMany.swift
//  CoreData_Relationships
//
//  Created by MOBILE HUTT on 01/12/25.
//

import SwiftUI

struct OneToManyView: View {
    
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(entity: Department.entity(), sortDescriptors: []) private var departments: FetchedResults<Department>
    
    @State private var deptName = ""
    @State private var empName = ""
    @State private var selectedDept: Department?
    
    var body: some View {
        VStack(spacing: 12) {
            
            HStack {
                TextField("Department", text: $deptName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Create") {
                    // createDept()
                    CoreDataHandler.shared.createDept(deptName: deptName)
                    deptName = ""
                }
            }
            .padding()
            
            HStack {
                TextField("Employee Name", text: $empName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add to Dept") {
                    if let selectedDept = selectedDept {
                        CoreDataHandler.shared.addEmployeeToDept(employeeName: empName, selectedDepartment: selectedDept)
                        empName = ""
                    }
                }
                .disabled(selectedDept == nil)
            }
            .padding(.horizontal)
            
            List {
                ForEach(departments) { dept in
                    DepartmentSection(dept: dept, selectedDept: $selectedDept)
                }
            }
            
        }
        .onAppear() {
            print("TODO: Will print Store URL!!!\(PersistenceController.shared.storeURL)")
        }
        .navigationTitle("One-to-Many")
    }
    
}


struct DepartmentSection: View {
    let dept: Department
    @Binding var selectedDept: Department?
    
    var body: some View {
        Section(
            header: DepartmentHeader(dept: dept, selectedDept: $selectedDept)
        ) {
            ForEach(dept.employeesArray) { emp in
                EmployeeRow(emp: emp)
            }
        }
    }
}

struct DepartmentHeader: View {
    let dept: Department
    @Binding var selectedDept: Department?
    
    var body: some View {
        HStack {
            Text(dept.name ?? "No Name")
            Spacer()
            Button("Select") {
                selectedDept = dept
            }
            Button("Delete") {
                
            }
        }
    }
}

struct EmployeeRow: View {
    let emp: Employee
    
    var body: some View {
        HStack {
            Text(emp.fullName ?? "")
            Spacer()
            Button("Delete") {
                CoreDataHandler.shared.deleteEmployee(employee: emp)
            }
            .foregroundColor(.red)
        }
    }
}



#Preview {
    OneToManyView()
}
