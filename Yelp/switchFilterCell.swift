//
//  switchFilterCell.swift
//  Yelp
//
//  Created by Elaine Mao on 4/25/15.
//  Copyright (c) 2015 Elaine Mao. All rights reserved.
//

import UIKit

@objc protocol switchFilterCellDelegate {
    optional func switchCell(switchCell: switchFilterCell, didChangeValue value: Bool)
}

class switchFilterCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate: switchFilterCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func switchValueChanged() {
        delegate?.switchCell?(self, didChangeValue: onSwitch.on)
    }
}
