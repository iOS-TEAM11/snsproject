//
//  EditMyPageViewController.swift
//  snsProject
//
//  Created by 하호형 on 2023/08/14.
//
// ***********    푸시 전 인포 변경    ************
import UIKit

class EditMyPageViewController: UIViewController{
    
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var editTableView: UITableView!
    
    
    
    let label = ["이름", "사용자 이름", "성별 대명사", "소개", "링크", "성별"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //이미지 버튼 원 작업
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileImage.clipsToBounds = true
    }
    
}
