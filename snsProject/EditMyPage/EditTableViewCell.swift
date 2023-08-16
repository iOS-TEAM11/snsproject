//
//  EditTableViewCell.swift
//  snsProject
//
//  Created by 하호형 on 2023/08/16.
//

import UIKit

class EditTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var editLabel: UILabel!
    
    
override func setSelected(_ selected: Bool, animated: Bool) {        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
