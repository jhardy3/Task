//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Jake Hardy on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedProperty.tasks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! ButtonTableViewCell
        let task = TaskController.sharedProperty.tasks[indexPath.row]

        cell.updateWith(task)
        cell.delegate = self

        return cell
    }
    
    // MARK: - Button Actions



    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            TaskController.sharedProperty.removeTask(TaskController.sharedProperty.tasks[indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if segue.identifier == "toAddTask" {
            let taskDetailView = segue.destinationViewController as! TaskDetailTableViewController
            taskDetailView.delegate = self
        } else {
            if let index = tableView.indexPathForSelectedRow?.row {
                let taskDetailView = segue.destinationViewController as! TaskDetailTableViewController
                _ = taskDetailView.view
                
                let task = TaskController.sharedProperty.tasks[index]
                taskDetailView.updateWith(task)
            }
        }
    }
}

    extension TaskListTableViewController: ButtonTableViewCellDelegate {
        func buttonCellButtonTapped(sender: ButtonTableViewCell) {
            if let index = tableView.indexPathForCell(sender)?.row, let isComplete = TaskController.sharedProperty.tasks[index].isComplete as? Bool {
                TaskController.sharedProperty.tasks[index].isComplete = !isComplete
                TaskController.sharedProperty.saveToPersistence()
                tableView.reloadData()
                
            }
        }
    }
    
   
    
