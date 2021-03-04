//
//  ContentView.swift
//  Assignment Notebook Redo
//
//  Created by Student on 2/23/21.
//

import SwiftUI

struct ContentView: View {
   @State var assignments = [AssignmentItem ( className: "Drama", discription:"line reading", dueDate: Date()), AssignmentItem(className: "English", discription: "writing a paper", dueDate: Date())]
    
    var body: some View
    {
        NavigationView {
                    List {

                       ForEach(assignments)
                        {
                        assignment in Text(assignment.discription)
                         }
                       .onMove(perform: { indices, newOffset in
                        assignments.move(fromOffsets: indices, toOffset: newOffset)
                       })
                       .onDelete(perform: { indexSet in
                        assignments.remove(atOffsets: indexSet)
                       })
                    }

                    .navigationBarTitle("Assinments")
                    .navigationBarItems(leading: EditButton())
                }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var className = String()
    var discription = String()
    var dueDate = Date()
    
}
