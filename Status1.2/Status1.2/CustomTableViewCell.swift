//
//  CustomTableViewCell.swift
//  Status1.2
//
//  Created by Micah Stone on 7/8/15.
//  Copyright © 2015 Micah Stone. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    
}