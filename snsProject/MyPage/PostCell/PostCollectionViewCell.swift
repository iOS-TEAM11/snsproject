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

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI(_ url: String) {
        guard let imageURL = URL(string: url) else {
            postImageView.image = UIImage(named: "짱구") // 예외 상황 처리
            return
        }

        // 이미지 다운로드 및 처리
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                print("Error downloading image: \(error)")
                DispatchQueue.main.async {
                    self.postImageView.image = UIImage(named: "짱구")
                }
                return
            }

            if let imageData = data, let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.postImageView.image = image
                }
            }
        }.resume()
    }

    // 외부접근
    public func setupData() {
        // 이미지 업로드
    }
}
