//
//  EditMyPageViewController.swift
//  snsProject
//
//  Created by 하호형 on 2023/08/14.
//
// ***********    푸시 전 인포 변경    ************
import UIKit

class EditMyPageViewController: UIViewController {
    
    var userName: [String] = []
    var userNickName: [String] = []
    var userGender: [String] = []
    var userIntro: [String] = []
    var userLink: [String] = []
    
    var userName: [String] = []
    var userNickName: [String] = []
    var userGender: [String] = []
    var userIntro: [String] = []
    var userLink: [String] = []
    
    @IBOutlet weak var profileImage: UIButton!

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNickName: UITextField!
    @IBOutlet weak var tfIntro: UITextField!
    @IBOutlet weak var tfLink: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //이미지 버튼 원 작업
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileImage.clipsToBounds = true
        
        navigationItem.title = "프로필 편집"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(enterUserData))
       // navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelEditing))
    }
   
    @objc func cancelEditing() {
        // 이전 뷰 컨트롤러로 돌아가는 코드 추가
        navigationController?.popViewController(animated: true)
    }
    
    //뷰 띄울때 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabController = tabBarController as? TabBarController {
            userName = tabController.userData.map { $0.userName }
            userNickName = tabController.userData.map { $0.userNickName }
            userGender = tabController.userData.map { $0.userGender }
            userIntro = tabController.userData.map { $0.userIntro }
            userLink = tabController.userData.map { $0.userLink }
            
        }
        
    }
    
    
   
    @IBAction func enterUserData(_ sender: Any) {
    
    
        // Name
        if let textField = tfName, let name = textField.text, !name.isEmpty {
            userName.append(name)
        } else {
            showAlert(message: "이름을 다시 입력해주세요")
            return
        }

        // Nickname
        if let textField = tfNickName, let nickname = textField.text, !nickname.isEmpty {
            userNickName.append(nickname)
        } else {
            showAlert(message: "닉네임을 다시 입력해주세요")
            return
        }

        // Intro
        if let textField = tfIntro, let intro = textField.text, !intro.isEmpty {
            userIntro.append(intro)
        } else {
            showAlert(message: "소개글을 다시 입력해주세요")
            return
        }

        // Link
        if let textField = tfLink, let link = textField.text, !link.isEmpty {
            userLink.append(link)
        } else {
            showAlert(message: "링크를 다시 입력해주세요")
            return
        }

        // Gender
        if let textField = tfGender, let gender = textField.text, !gender.isEmpty {
            userGender.append(gender)
        } else {
            showAlert(message: "성별을 다시 입력해주세요")
            return
            
        }
        
        cancelEditing()
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    //뷰 띄울때 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabController = tabBarController as? TabBarController {
            userName = tabController.userData.map { $0.userName }
            userNickName = tabController.userData.map { $0.userNickName }
            userGender = tabController.userData.map { $0.userGender }
            userIntro = tabController.userData.map { $0.userIntro }
            userLink = tabController.userData.map { $0.userLink }
            
        }
    }
    
    
   
    @IBAction func enterUserData(_ sender: Any) {
    
    
        // Name
        if let textField = tfName, let name = textField.text, !name.isEmpty {
            userName.append(name)
        } else {
            showAlert(message: "이름을 다시 입력해주세요")
            return
        }

        // Nickname
        if let textField = tfNickName, let nickname = textField.text, !nickname.isEmpty {
            userNickName.append(nickname)
        } else {
            showAlert(message: "닉네임을 다시 입력해주세요")
            return
        }

        // Intro
        if let textField = tfIntro, let intro = textField.text, !intro.isEmpty {
            userIntro.append(intro)
        } else {
            showAlert(message: "소개글을 다시 입력해주세요")
            return
        }

        // Link
        if let textField = tfLink, let link = textField.text, !link.isEmpty {
            userLink.append(link)
        } else {
            showAlert(message: "링크를 다시 입력해주세요")
            return
        }

        // Gender
        if let textField = tfGender, let gender = textField.text, !gender.isEmpty {
            userGender.append(gender)
        } else {
            showAlert(message: "성별을 다시 입력해주세요")
            return
        }

        

        
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
