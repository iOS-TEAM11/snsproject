//
//  CommentViewController.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/19.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var dmButton: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var commentField: UITextView!
        
    @IBOutlet weak var commentProfileImage: UIImageView!
    
    @IBOutlet weak var separateLine: UIView!
    
    
    var keyboardHeight: CGFloat = 0
    var placeholderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.layer.cornerRadius = 5
        headerView.clipsToBounds = true
        
        commentField.layer.borderWidth = 0.3
        commentField.layer.borderColor = UIColor.lightGray.cgColor
        commentField.layer.cornerRadius = 20
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        //placeholder
        placeholderLabel = UILabel()
        placeholderLabel.text = " instagram_id(으)로 댓글 달기..."
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.font = UIFont.systemFont(ofSize: 13)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        commentField.addSubview(placeholderLabel)
        
        placeholderLabel.leadingAnchor.constraint(equalTo: commentField.leadingAnchor, constant: 8).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: commentField.topAnchor, constant: 8).isActive = true
        
        commentField.delegate = self
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
               keyboardHeight = keyboardFrame.size.height
               
               //댓글 창을 키보드의 높이만큼 올립니다
               UIView.animate(withDuration: 0.3) {
                   self.view.frame.origin.y = -self.keyboardHeight
               }
           }
    }
}

extension CommentViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
