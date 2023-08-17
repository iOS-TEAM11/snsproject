//
//  ViewController.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/14.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        //FeedTableViewCell가 생긴걸 viewDidLoad아래에 등록해줘야함 , Nib은 FeedTableViewCell을 의미 ..
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }
    
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    //numberOfRowsInSection - 한 섹션에 몇개의 셀을 넣을건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //cellForRowAt - 어떠한 셀을 보여줄 것인지? -> FeedTableViewCell 보여줄거임!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 600
    }
  }

