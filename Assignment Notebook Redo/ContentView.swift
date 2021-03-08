//
//  ContentView.swift
//  Assignment Notebook Redo
//
//  Created by Student on 2/23/21.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var assignments = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View
    {
        NavigationView {
                    List {

                        ForEach(assignments.assignment)
                        {
                        assignment in
                        HStack{
                        VStack(alignment: .leading)
                            {
                            Text(assignment.className)
                                .font(.headline)
                            Text(assignment.discription)
                            }
                            Spacer()
                            Text(assignment.dueDate,style: .date)
                        }
                         }
                       .onMove(perform: { indices, newOffset in
                        assignments.assignment.move(fromOffsets: indices, toOffset: newOffset)
                       })
                       .onDelete(perform: { indexSet in
                        assignments.assignment .remove(atOffsets: indexSet)
                       })
                    }

                    .sheet(isPresented: $showingAddAssignmentView, content: {
                        AddAssignmentView(assignmentList: assignments)
                    })
                    .navigationBarTitle("Assinments")
                    .navigationBarItems(leading: EditButton(), trailing: Button(action:{ showingAddAssignmentView = true
                        
                    }){Image(systemName: "plus")})
                }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable ,Codable{
    var id = UUID()
    var className = String()
    var discription = String()
    var dueDate = Date()
    
}
