//
//  Task.swift
//  Task
//
//  Created by Jake Hardy on 2/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    // initialization 
    
    convenience init(name: String, notes: String?, due: NSDate?, insertIntoManagedObjectContext context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = false
        
    }
    
    // Saving to persistence
    
   
    
}
