//
//  ContentView.swift
//  Assignment Notebook Redo
//
//  Created by Student on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    var assignments = ["assignment1", "assignment2", "assignment3"]
    
    var body: some View
    {
        NavigationView {
                    List {

                       ForEach(assignments, id: \.self)
                        {
                            assignment in Text(assignment)


                                        }

                    }

                    .navigationBarTitle("Assinments")

                }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
