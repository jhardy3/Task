//
//  TaskController.swift
//  Task
//
//  Created by Jake Hardy on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class TaskController {
    
    // MARK: - Keys
    
    private let tasksKey = "tasksKey"
    
    // MARK: - Properties
    
    var tasks: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        do {
            return try moc.executeFetchRequest(request) as! [Task]
        } catch {
            print(error)
        }
        
        return []
        
    }
    
    // MARK: - Shared Properties
    
    static let sharedProperty = TaskController()
    
    // MARK: - Computed Properties
    
    var mockTasks: [Task] {
        get {
            let mockTaskArray = [
                Task(name: "No", notes: "hi", due: NSDate())
            ]
            
            return mockTaskArray
        }
    }
    
    
    // Builds an array of completed tasks
    var completedTasks: [Task] {
        get {
            let filteredArray = tasks.filter {$0.isComplete == true}
            return filteredArray
        }
    }
    
    // Builds an array of tasks yet to be completed
    var inCompleteTasks: [Task] {
        get {
            let filteredArray = tasks.filter {$0.isComplete == false}
            return filteredArray
        }
    }

    
    // MARK: - Initializers
    
    
    
    // MARK: - ADD and REMOVE functions
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistence()
    }
    
    func removeTask(task: Task) {
        let moc = Stack.sharedStack.managedObjectContext
        
        moc.deleteObject(task)
        
        saveToPersistence()
    }
    
    // MARK: - Archiving and Retrieving
    
    //    func loadFromPersistenStorage() {
    //        let tasks = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath(tasksKey))
    //        if let tasks = tasks as? [Task] {
    //            self.tasks = tasks
    //        }
    //
    //    }
    
    //    func saveToPersistentStorage() {
    //        NSKeyedArchiver.archiveRootObject(self.tasks, toFile: filePath(tasksKey))
    //
    //    }
    
    
    //    func filePath(keyForPath: String) -> String {
    //
    //        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
    //        let documentPath: AnyObject = directorySearchResults[0]
    //        let tasksPath = documentPath.stringByAppendingString("/\(keyForPath).plist")
    //        return tasksPath
    //
    //    }
    
    // TODO: Implement CoreData save and load functions
    
    func saveToPersistence() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
}