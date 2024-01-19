//
//  UserTableViewCell.swift
//  BitcodeMachineTest
//
//  Created by Mac on 19/01/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
