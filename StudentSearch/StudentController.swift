//
//  StudentController.swift
//  StudentSearch
//
//  Created by Steven Patterson on 8/1/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import Foundation

class StudentController {
    static var students = ["Patrick", "Jeff", "Tim", "Brad", "Joseph", "Chad", "Chris", "Ryan", "Mitch", "Travis", "Michael", "Diego", "Spencer"]
    
    static func searchForStudentWithName(name: String) -> [String] {
        return students.filter({$0.lowercaseString.containsString(name)})
    }
    

}