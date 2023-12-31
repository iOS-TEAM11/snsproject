import UIKit

class MyPageCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyPageCollectionViewCell"
    
    @IBOutlet var myPageImageView: UIImageView!
    
    @IBOutlet var addProfileImageView: UIImageView!
    
    @IBOutlet var editButton: UIButton!
    
    @IBOutlet var addFriendButton: UIButton!
    
    @IBOutlet var postingCountLabel: UILabel!
    
    weak var parentViewController: UIViewController?
    
    @IBAction func goToEditPage(_ sender: Any) {
        print("1")
        let storyBoard = UIStoryboard(name: "EditMyPage", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "EditMyPageViewController") as! EditMyPageViewController

        parentViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet var followerCountLabel: UILabel!
    
    @IBOutlet var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    
    private func setupAttribute() {
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
        
        postingCountLabel.text = String(DataManager.shared.posts.count)

        [followerCountLabel, followingCountLabel].forEach { $0?.text = "\(Int.random(in: 100 ... 300))" }
    }
}
