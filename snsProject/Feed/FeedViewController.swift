//
//  ViewController.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/14.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // 피드화면 데이터
    var feedImage: [UIImage] = []
    var feedText: [String] = []
    let dummyImage1 = #imageLiteral(resourceName: "dummy1")
    let dummyImage2 = #imageLiteral(resourceName: "dummy2")
    var userId = "11조  "
    
    
    func loadDummyData() {
        feedImage.append(contentsOf: [dummyImage1, dummyImage2])
        feedText.append(contentsOf: ["iOS개발자가 되고 싶어요", "제발요"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDummyData()


        tableView.delegate = self
        tableView.dataSource = self
        //FeedTableViewCell가 생긴걸 viewDidLoad아래에 등록해줘야함 , Nib은 FeedTableViewCell을 의미 ..
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    //뷰 띄울때 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    //numberOfRowsInSection - 한 섹션에 몇개의 셀을 넣을건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedImage.count
    }
    
    //cellForRowAt - 어떠한 셀을 보여줄 것인지? -> FeedTableViewCell 보여줄거임!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.imageViewFeed.image = feedImage[indexPath.row]
        cell.labelFeed.text = userId + feedText[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 600
    }
  }

