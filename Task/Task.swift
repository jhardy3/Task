//
//  Task.swift
//  Task
//
//  Created by Jake Hardy on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    
    // MARK: - Keys
    
    private let notesKey = "notesKey"
    private let dueKey = "dueKey"
    private let isCompleteKey = "isCompleteKey"
    private let nameKey = "nameKey"
    
    // MARK: - Properties
    
    // Notes and Due can be nil in the case of a task
    var name: String
    var notes: String?
    var due: NSDate?
    var isComplete: Bool
    
    
    // MARK: - Initializers
    
    init(name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        // Set default parameters for notes, due and isComplete? CHECK NEEDS WORK && UNDERSTANDING
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObjectForKey(nameKey) as? String else {
            self.name = ""
            self.notes = nil
            self.due = nil
            self.isComplete = false
            super.init()
            return nil
        }
        self.name = name
        self.notes = aDecoder.decodeObjectForKey(notesKey) as? String
        self.due = aDecoder.decodeObjectForKey(dueKey) as? NSDate
        self.isComplete = aDecoder.decodeObjectForKey(isCompleteKey) as! Bool
        super.init()
    }
    
    
    // MARK: - Encoding && Archiving
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: nameKey)
        aCoder.encodeObject(isComplete, forKey: isCompleteKey)
        if due != nil && notes != nil {
            aCoder.encodeObject(notes, forKey: notesKey)
            aCoder.encodeObject(due, forKey: dueKey)
        }
        
    }
    
    // MARK: - Equatability Functions
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? Task {
            return self.name == object.name && self.isCompleteKey == object.isCompleteKey && self.notes == object.notes
        } else {
            return false
        }
    }
    
}

func ==(lhs: Task, rhs: Task) -> Bool {
    
    return lhs.name == rhs.name && lhs.isCompleteKey == rhs.isCompleteKey && lhs.notes == rhs.notes
    
}
