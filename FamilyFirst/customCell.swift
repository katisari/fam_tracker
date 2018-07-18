//
//  customCell.swift
//  FamilyFirst
//
//  Created by Katie  Lee on 7/17/18.
//  Copyright © 2018 Christopher Chung. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var uniqueColorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
