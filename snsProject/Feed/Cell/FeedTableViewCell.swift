//
//  FeedTableViewCell.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/15.
//

import UIKit

protocol FeedTableViewCellDelegate: AnyObject {
    func showCommentModalViewController()
    func didTapDeleteButton(in cell: FeedTableViewCell)
    func didTapModifyButton(in cell: FeedTableViewCell)

}

class FeedTableViewCell: UITableViewCell {
    weak var delegate: FeedTableViewCellDelegate?
    
    @IBOutlet weak var imageViewUseProfile: UIImageView!
    
    @IBOutlet weak var labelUserName: UILabel!
    
    @IBOutlet weak var imageViewFeed: UIImageView!
    
    @IBOutlet weak var buttonIsHeart: UIButton!
    
    @IBOutlet weak var buttonIsBookMark: UIButton!
    
    @IBOutlet weak var labelHowManyLike: UILabel!
    
    @IBOutlet weak var labelFeed: UILabel!
    
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    @IBAction func popUpButton(_ sender: Any) {
        
            print("popup")
    }
    
    var likeCount: Int = 999 {
        didSet {
            labelHowManyLike.text = "좋아요 \(likeCount)개"
        }
    }
    
    @IBOutlet weak var pullDownButton: UIButton!
    
        @IBAction func actionIsHeart(_ sender: Any) {
        buttonIsHeart.isSelected.toggle()
        if buttonIsHeart.isSelected {
            likeCount += 1
        } else {
            likeCount -= 1
        }
    }
    
    @IBAction func didClickCommentButton(_ sender: UIButton) {
        delegate?.showCommentModalViewController()
    }
    
    @IBAction func actionBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        } else {
            buttonIsBookMark.isSelected = true
        }
    }
    
    
    // 풀다운 버튼 함수
    func setUpPullDownButton() {
            
            let optionClosure = {  [weak self] (action: UIAction) in
                if action.title == "수정" {
                    self?.delegate?.didTapModifyButton(in: self!) }
                else if action.title == "삭제" {
                    self?.delegate?.didTapDeleteButton(in: self!)
                }
                print(action.title)
            }
        

        self.pullDownButton.menu = UIMenu(children : [
            UIAction(title: "수정", state: .off, handler: optionClosure),
            UIAction(title: "삭제", handler: optionClosure)
        ])

        self.pullDownButton.showsMenuAsPrimaryAction = true
        self.pullDownButton.changesSelectionAsPrimaryAction = false
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //이미지 더블 탭
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTappedImageView))
        doubleTapGesture.numberOfTapsRequired = 2
        imageViewFeed.addGestureRecognizer(doubleTapGesture)
        imageViewFeed.isUserInteractionEnabled = true
        
        setUpPullDownButton()

       //좋아요 밑에 아이디 bold설정
        let fontSize = UIFont.boldSystemFont(ofSize: 15)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")

        //폰트 bold 범위 설정 -> snsProject값을 넣어놔서 일단 10 넣어놓음
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 10 ))

        labelFeed.attributedText = attributedStr
        
        labelUserName.text = "iOS_TEAM11"
        labelUserName.font = UIFont.boldSystemFont(ofSize: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func doubleTappedImageView() {
        //하트 이미지 생성
        let heartImageView = UIImageView(image: UIImage(named: "Vector"))
        //시작 위치 설정
        heartImageView.frame = CGRect(x: imageViewFeed.frame.midX, y: imageViewFeed.frame.midY, width: 40, height: 40)
        self.addSubview(heartImageView)
        
        UIView.animate(withDuration: 0.8,
        //애니메이션 종료 시의 위치 설정
        animations: {heartImageView.frame.origin.y -= 100},
        //위로 이동하며 사라지는 효과
        completion: { _ in heartImageView.removeFromSuperview()})
        
        buttonIsHeart.isSelected.toggle()
        //좋아요 개수
        if buttonIsHeart.isSelected {
            likeCount += 1
        } else {
            likeCount -= 1
        }
    }
}

