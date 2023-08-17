//
//  MyPageCollectionViewCell.swift
//  snsProject
//
//  Created by t2023-m0050 on 2023/08/14.
//

import UIKit

class MyPageCollectionViewCell: UICollectionViewCell {
    
    
 //   let myViewController = MyPageViewController() 체크해보기
    
//    myViewController.
//    UIImagePickerController.cellController = self
    
    static let identifier = "MyPageCollectionViewCell"
    
    @IBOutlet weak var myPageImageView: UIImageView!
    
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    
    @IBAction func goToEditPage(_ sender: Any) {
        
    }
    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    
    private func setupAttribute(){
        myPageImageView.layer.cornerRadius = 88 / 2
        addProfileImageView.layer.cornerRadius = 24 / 2
        
        myPageImageView.layer.borderColor = UIColor.darkGray.cgColor
        myPageImageView.layer.borderWidth = 1
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        postingCountLabel.text = String(MyPageViewController().myFeedImg.count)
        
        [followerCountLabel, followingCountLabel].forEach { $0?.text = "\(Int.random(in: 0...10))"}
    }
}
