//
//  FeedTableViewCell.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/15.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUseProfile: UIImageView!
    
    @IBOutlet weak var labelUserName: UILabel!
    
    @IBOutlet weak var imageViewFeed: UIImageView!
    
    @IBOutlet weak var buttonIsHeart: UIButton!
    
    @IBOutlet weak var buttonIsBookMark: UIButton!
    
    @IBOutlet weak var labelHowManyLike: UILabel!
    
    @IBOutlet weak var labelFeed: UILabel!
    
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected {  //true면 클릭이 되어있는 거니까 false로 클릭을 풀어줌
            buttonIsHeart.isSelected = false
        } else { //아닐경우엔 클릭을 다시 해 주 ㅁ
            buttonIsHeart.isSelected = true
        }
    }
    
    @IBAction func actionBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        } else {
            buttonIsBookMark.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //좋아요 밑에 아이디 bold설정
        let fontSize = UIFont.boldSystemFont(ofSize: 15)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        //폰트 bold 범위 설정 -> snsProject값을 넣어놔서 일단 10 넣어놓음
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 10 ))
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
