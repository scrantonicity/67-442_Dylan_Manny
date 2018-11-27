//
//  TableViewCell.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/4/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
  
  @IBOutlet weak var year: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var artist: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
}
