//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Jake Hardy on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    
    var delegate: TaskListTableViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonTapped(sender: UIButton) {
        print("bang!")
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
        
    }
    
    func updateWith(task: Task) {
        taskNameLabel.text = task.name
        updateButton(task.isComplete)
        
    }
    
    func updateButton(isComplete: Bool) {
        if !isComplete {
            completionButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completionButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}