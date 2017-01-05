//
//  StudentTableViewController.swift
//  StudentSearch
//
//  Created by Steven Patterson on 8/1/16.
//  Copyright © 2016 Steven Patterson. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
    
    func setupSearchController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultsController = storyboard.instantiateViewControllerWithIdentifier("resultsTVC")
        
        searchController = UISearchController(searchResultsController: resultsController)
        guard let searchController = searchController else {return}
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Search For Student"
        searchController.definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
            resultsController = searchController.searchResultsController as? ResultsTableViewController else {return}
 
        resultsController.filteredStudents = StudentController.searchForStudentWithName(text.lowercaseString)
        resultsController.tableView.reloadData()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.students.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath)

        let student = StudentController.students[indexPath.row]
        cell.textLabel?.text = student
        
        return cell
    }
 

}
