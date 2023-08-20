//
//  CommentViewController.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/19.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var commentLabel: UILabel!
    
    @IBOutlet var dmButton: UIButton!
    
    @IBOutlet var headerView: UIView!
    
    @IBOutlet var commentField: UITextView!
        
    @IBOutlet var commentProfileImage: UIImageView!
    
    @IBOutlet var separateLine: UIView!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var registerBtn: UIButton!
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        if !commentField.text.isEmpty {
            comment.append(commentField.text)
            commentField.text = "" // 댓글 입력 필드 초기화
            tableView.reloadData() // 댓글 추가되면 테이블뷰 리로드
            // 입력된 댓글의 셀로 스크롤
            let indexPath = IndexPath(row: comment.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            // 키보드 자동으로 내리기
            commentField.resignFirstResponder()
        }
    }
    
    var keyboardHeight: CGFloat = 0
    var placeholderLabel: UILabel!
    // 배열에 댓글 저장
    var comment: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let CommentNib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.register(CommentNib, forCellReuseIdentifier: "CommentTableViewCell")
        
        headerView.layer.cornerRadius = 5
        headerView.clipsToBounds = true
        
        commentField.layer.borderWidth = 0.3
        commentField.layer.borderColor = UIColor.lightGray.cgColor
        commentField.layer.cornerRadius = 20
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        // placeholder
        placeholderLabel = UILabel()
        placeholderLabel.text = " instagram_id(으)로 댓글 달기..."
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.font = UIFont.systemFont(ofSize: 13)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        commentField.addSubview(placeholderLabel)
        
        placeholderLabel.leadingAnchor.constraint(equalTo: commentField.leadingAnchor, constant: 8).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: commentField.topAnchor, constant: 8).isActive = true
        
        commentField.delegate = self
        // 구분선 없애기
        tableView.separatorStyle = .none
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        {
            keyboardHeight = keyboardFrame.size.height
               
            // 댓글 창을 키보드의 높이만큼 올립니다
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = -self.keyboardHeight
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
}

extension CommentViewController: UITextViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else {
            return UITableViewCell()
        }
        
        let comment = comment[indexPath.row]
        cell.commentFieldLabel.text = comment // 셀에 댓글 표시
        
        return cell
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    // 댓글 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            comment.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
