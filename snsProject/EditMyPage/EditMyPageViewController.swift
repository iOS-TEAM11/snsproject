//
//  EditMyPageViewController.swift
//  snsProject
//
//  Created by 하호형 on 2023/08/14.
//
// ***********    푸시 전 인포 변경    ************
import UIKit

class EditMyPageViewController: UIViewController{
    
    // 데이터 저장 배열
    var userName: [String] = []
    var userNickName: [String] = []
    var userIntro: [String] = []
    var userLink: String = "링크 추가" // 초기 값 설정
    var selectedGender: String = "선택 하세요" // 초기 값 설정
    
    
    
    @IBOutlet weak var profileImage: UIButton!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNickName: UITextField!
    @IBOutlet weak var tfIntro: UITextField!
    
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var genderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //성별 선택 버튼 초기화
        pushgenderButton()
        
        //링크 버튼 초기화
        updateLinkButtonTitle()
        
        //이미지 버튼 둥글게 작업
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileImage.clipsToBounds = true
        
        //네비게이션 바 커스텀
        navigationItem.title = "프로필 편집"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(enterUserData))
        //네비게이션 바 백 버튼 커스텀
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelEditing))
        
        //링크 버튼 커스텀
        linkButton.setTitle("링크 추가", for: .normal)
        linkButton.setTitleColor(UIColor.black.withAlphaComponent(0.3), for: .normal)
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
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
        
        if let lastUser = UserDataManager.shared.userArray.last {
            tfName.text = lastUser.userName
            tfNickName.text = lastUser.userNickName
            tfIntro.text = lastUser.userIntro
            
            userLink = lastUser.userLink
            updateLinkButtonTitle() // 링크 버튼 타이틀 업데이트
            
            // 저장된 URL을 설정 (링크가 비어있지 않을 경우에만 업데이트)
            if !userLink.isEmpty, let url = URL(string: userLink) {
                linkURL = url
            }
            
            
            selectedGender = lastUser.userGender
            genderButton.setTitle(selectedGender.isEmpty ? "선택하세요" : selectedGender, for: .normal)
            let isGenderSelected = selectedGender == "남성" || selectedGender == "여성"
            genderButton.setTitleColor(isGenderSelected ? .black : UIColor.black.withAlphaComponent(0.3), for: .normal)
        }
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
        if userLink == "링크 추가" {
            showAlert(message: "링크를 다시 입력해주세요")
            return
        }
        
        // Gender
        if selectedGender == "선택 하세요" {
            showAlert(message: "성별을 선택해주세요")
            return
        }
        
        
        //데이터 생성 및 저장
        let user = UserDatum(
            userImage: UIImage(),
            userName: userName.last ?? "",
            userNickName: userNickName.last ?? "",
            userGender: selectedGender,
            userIntro: userIntro.last ?? "",
            userLink: userLink)
        
        UserDataManager.shared.addUser(user: user)
        
        //데이터 저장후 화면 전환
        cancelEditing()
        
        // 업데이트된 부분: 링크 버튼 타이틀 업데이트
        updateLinkButtonTitle()
        
    }
    
    // 링크 버튼을 누를 때의 동작
    var linkURL: URL?
    @IBAction func linkButtonTapped(_ sender: Any) {
        // "링크 추가" 버튼을 누른 경우에만 링크를 입력받도록 함
        if userLink == "링크 추가" {
            let alert = UIAlertController(title: "링크 추가", message: "링크를 입력해주세요.", preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "http://"
            }
            let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
                if let linkTextField = alert.textFields?.first, let link = linkTextField.text, !link.isEmpty {
                    self?.userLink = link
                    self?.updateLinkButtonTitle()
                    
                    // 저장된 URL을 설정
                    self?.linkURL = URL(string: link)
                    
                    // 입력받은 링크로 버튼 타이틀 설정
                    self?.linkButton.setTitle(link, for: .normal)
                }
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(addAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        } else {
            // 버튼을 누를 때 저장된 URL로 웹 페이지 열기
            if let url = linkURL, UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    // 링크 버튼 타이틀 업데이트
    func updateLinkButtonTitle() {
        linkButton.setTitle(userLink, for: .normal)
        // 링크 항목에 값이 들어있을때 색상지정
        let isLinkAdded = userLink != "링크 추가"
        linkButton.setTitle(userLink, for: .normal)
        linkButton.setTitleColor(isLinkAdded ? UIColor.black : UIColor.black.withAlphaComponent(0.7), for: .normal)
    }
    
    //경고창
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
    
    
    

