//
//  CommentTableViewCell.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/20.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CommentProfile: UIImageView!
    
    @IBOutlet weak var commentId: UILabel!
    
    @IBOutlet weak var commentFieldLabel: UILabel!
    
    @IBOutlet weak var commentBtnHeart: UIButton!
    
    
    @IBAction func actionCommentHeart(_ sender: UIButton) {
        if commentBtnHeart.isSelected {
            commentBtnHeart.isSelected = false
        } else {
            commentBtnHeart.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
