//
//  AssignmentList.swift
//  Assignment Notebook Redo
//
//  Created by Student on 3/4/21.
//

import Foundation
class AssignmentList: ObservableObject {
    @Published var assignment = [AssignmentItem ( className: "Drama", discription:"line reading", dueDate: Date()), AssignmentItem(className: "English", discription: "writing a paper", dueDate: Date())]
}
