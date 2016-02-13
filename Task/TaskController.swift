//
//  TaskController.swift
//  Task
//
//  Created by Jake Hardy on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class TaskController {
    
    // MARK: - Keys
    
    private let tasksKey = "tasksKey"
    
    // MARK: - Properties
    
    var tasks = [Task]()
    
    // MARK: - Shared Properties
    
    static let sharedProperty = TaskController()
    
    // MARK: - Computed Properties
    
    var mockTasks: [Task] {
        get {
            let mockTaskArray = [
                Task(name: "Walk Dog", notes: "Walk Jonas around the corner", due: NSDate(), isComplete: false),
                Task(name: "Finish Programming", notes: "This will never happen.", due: nil, isComplete: false),
                Task(name: "Tie Shoes", notes: "loopty loop and through", due: nil, isComplete: true)
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
    
    init() {
        self.tasks = mockTasks
        loadFromPersistenStorage()
        
    }
    
    // MARK: - ADD and REMOVE functions
    
    func addTask(task: Task) {
        tasks.append(task)
        saveToPersistentStorage()
    }
    
    func removeTask(task: Task) {
        for var i = 0; i < tasks.count; i++ {
            if tasks[i].isEqual(task) {
                tasks.removeAtIndex(i)
            }
        }
        saveToPersistentStorage()
    }
    
    // MARK: - Archiving and Retrieving
    
    func loadFromPersistenStorage() {
        let tasks = NSKeyedUnarchiver.unarchiveObjectWithFile(tasksKey)
        if let tasks = tasks as? [Task] {
            self.tasks = tasks
        }
        
    }
    
    func saveToPersistentStorage() {
        NSKeyedArchiver.archiveRootObject(self.tasks, toFile: filePath(tasksKey))
        
    }
    
    
    func filePath(keyForPath: String) -> String {
        
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let documentPath: AnyObject = directorySearchResults[0]
        let tasksPath = documentPath.stringByAppendingString("/\(keyForPath).plist")
        return tasksPath
        
    }
    
    
    
    
    
    
    
    
    
}