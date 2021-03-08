//
//  AddAssignmentView.swift
//  Assignment Notebook Redo
//
//  Created by Student on 3/4/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var className = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presantationMode
    static let classNames = ["Mobile Apps", "Art", "English", "PE", "Dance", "Drama", "Math","BHS-TV", "Lunch", "Civics"]
    
    var body: some View {
        NavigationView
        {
            Form
            {
                Picker ("Class Name", selection: $className)
                {
                    ForEach (Self.classNames, id:\.self)
                        {
                            className in Text (className)
                        }
                }
                TextField("Discription", text: $description)
                DatePicker ("Due Date", selection:$dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add new assignments")
            .navigationBarItems(trailing: Button("Save")
            {
                if className.count>0&&description.count > 0
                {
                    let assignment = AssignmentItem(id: UUID(), className: className, discription: description, dueDate: dueDate)
                    assignmentList.assignment.append(assignment)
                    presantationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
