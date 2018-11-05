//
//  HeadlineTableViewCell.swift
//  67442_DM
//
//  Created by Manuel Lopez on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
  
  @IBOutlet weak var headline: UILabel!
  @IBOutlet weak var year: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

