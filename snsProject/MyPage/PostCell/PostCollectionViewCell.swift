//
//  PostCollectionViewCell.swift
//  snsProject
//
//  Created by t2023-m0050 on 2023/08/15.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"

    @IBOutlet var postImageView: UIImageView!


    
    func setPostImage(_ image: UIImage) {
        postImageView.image = image
    }
}
