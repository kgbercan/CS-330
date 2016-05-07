//
//  RowerTableViewCell.swift
//  PaceGuide
//
//  Created by Karina Bercan on 5/5/16.
//  Copyright © 2016 Karina Bercan. All rights reserved.
//

import UIKit

class RowerTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var fiveHundLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
