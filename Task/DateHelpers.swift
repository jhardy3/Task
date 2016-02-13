//
//  DateHelpers.swift
//  Task
//
//  Created by Jake Hardy on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

extension NSDate {
    
    func stringValue() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        
        return formatter.stringFromDate(self)
    }
    
}