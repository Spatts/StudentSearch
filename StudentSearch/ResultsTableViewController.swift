//
//  ResultsTableViewController.swift
//  StudentSearch
//
//  Created by Steven Patterson on 8/1/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    var filteredStudents: [String] = []
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStudents.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsCell", forIndexPath: indexPath)
        let student = filteredStudents[indexPath.row]
        cell.textLabel?.text = student
        
        return cell
    }
 
}