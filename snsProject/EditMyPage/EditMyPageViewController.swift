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
        editTableView.dataSource = self
        editTableView.delegate = self
    
        
    //이미지 버튼 원 작업
    profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
    profileImage.clipsToBounds = true
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editCell = segue.destination as? EditDetailViewController,
           let selectedIndexPath = editTableView.indexPathForSelectedRow {
            if label[selectedIndexPath.row] == "이름" {
                print("0")
                editCell.view.backgroundColor = .red
            } else if label[selectedIndexPath.row] == "사용자 이름" {
                print("1")
                editCell.view.backgroundColor = .blue
            } else if label[selectedIndexPath.row] == "성별 대명사" {
                print("2")
            } else if label[selectedIndexPath.row] == "소개" {
                print("3")
            } else if label[selectedIndexPath.row] == "링크" {
                print("4")
            } else if label[selectedIndexPath.row] == "성별" {
                print("5")
            }
        }
    }
}

        

extension EditMyPageViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath) as! EditTableViewCell
        
        if indexPath.row == 4 {
            cell.titleLabel?.text = "링크"
            cell.editLabel?.text = "링크 추가"
        }else{
            cell.titleLabel?.text = label[indexPath.row]
            cell.editLabel?.text = label[indexPath.row]
        }
        return cell
    }
    
}

