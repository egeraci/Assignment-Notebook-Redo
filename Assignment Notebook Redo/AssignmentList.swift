//
//  AssignmentList.swift
//  Assignment Notebook Redo
//
//  Created by Student on 3/4/21.
//

import Foundation
class AssignmentList: ObservableObject {
    @Published var assignment: [AssignmentItem]
    {
        didSet
        {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(assignment)
            {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    init()
    {
        if let assignment = UserDefaults.standard.data(forKey: "data")
        {
                let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: assignment)
            {
                self.assignment = decoded
                return
            }
        }
        assignment = []
    }
}
