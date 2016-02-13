//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Jake Hardy on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskNoteTextView: UITextView!
    @IBOutlet weak var taskDateLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var dueDate: String?
    
  
    
    
    let section = ["name", "due", "Notes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDateLabel.inputView = datePicker
        taskName.text = "taskName"
        taskNoteTextView.text = "hahahah"
        taskDateLabel.text = "noooo"

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.section.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // MARK: - Action Buttons
    
    @IBAction func addButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func datePickerFire(sender: UIDatePicker) {
        dueDate = datePicker.date.stringValue()
        taskDateLabel.text = dueDate
    }
    
    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        datePicker.resignFirstResponder()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Name"
        case 1:
            return "Due"
        case 2:
            return "Notes"
        default :
            return nil
        }
    }
    
//    func updateWith(task:Task) {
//        taskName.text = "hi"
//        
//    }
//    
}
