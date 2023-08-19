//
//  EditMyPageViewController.swift
//  snsProject
//
//  Created by 하호형 on 2023/08/14.
//
// ***********    푸시 전 인포 변경    ************
import UIKit

class EditMyPageViewController: UIViewController {
    
    // 데이터 저장 배열
    var userName: [String] = []
    var userNickName: [String] = []
    var userIntro: [String] = []
    var userLink: [String] = []
    var selectedGender: String = "선택 하세요" // 초기 값 설정

    
    
    @IBOutlet weak var profileImage: UIButton!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNickName: UITextField!
    @IBOutlet weak var tfIntro: UITextField!
    @IBOutlet weak var tfLink: UITextField!
    
    @IBOutlet weak var genderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //성별 선택 버튼 초기화
        pushgenderButton()
        
        //이미지 버튼 둥글게 작업
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileImage.clipsToBounds = true
        
        //네비게이션 바 커스텀
        navigationItem.title = "프로필 편집"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(enterUserData))
        
        //네비게이션 바 백 버튼 커스텀
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelEditing))
        
        
    }
    
    func pushgenderButton(){
        let genderoption = { [weak self] (genderaction: UIAction) in
                    guard let self = self else { return }
                    self.selectedGender = genderaction.title
                    self.genderButton.setTitle(self.selectedGender, for: .normal)
            
        
                    // 선택한 성별에 따라 텍스트 스타일 변경
                    let isGenderSelected = self.selectedGender == "남성" || self.selectedGender == "여성"
                    self.genderButton.setTitleColor(isGenderSelected ? .black : UIColor.black.withAlphaComponent(0.3), for: .normal)
            
            
        }
        
        // 항목 추가
        let maleAction = UIAction(title: "남성", handler: genderoption)
        let femaleAction = UIAction(title: "여성", handler: genderoption)
        let grnderAction = UIAction(title: "선택 하세요", handler: genderoption)
        
        // 항목 표시
        genderButton.menu = UIMenu(children: [grnderAction, maleAction, femaleAction,])
        genderButton.showsMenuAsPrimaryAction = true
        genderButton.changesSelectionAsPrimaryAction = true

        // 선택전 설정
        genderButton.setTitle("선택 하세요", for: .normal)
        genderButton.setTitleColor(UIColor.black.withAlphaComponent(0.3), for: .normal)
        genderButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        
    }
    
    

    
    @objc func cancelEditing() {
        // 이전 뷰 컨트롤러로 돌아가는 코드 추가
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    //뷰 띄울때 마지막 저장된 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }

    
    
    // 데이터 받아 저장
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
        if selectedGender == "선택 하세요" {
            showAlert(message: "성별을 선택해주세요")
            return
        }

        //데이터 저장후 화면 전환
        cancelEditing()
        
        //경고창
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}
