import UIKit

class MyPageDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var feedImg: [UIImage] = []
    var feedText: [String] = []
    var selectedImage: UIImage?
    
    var selectedIndexPath: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabBarController = tabBarController as? TabBarController {
            feedImg = tabBarController.posts.map{ $0.image }
            feedText = tabBarController.posts.map{ $0.description }
            let indexPath:IndexPath = IndexPath(row: selectedIndexPath!, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            
            tableView.reloadData()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("viewwillDisappear")
        //다른 tabBar icon을 누를 시, 강제로 view 빼주기
        self.navigationController?.popViewController(animated: true)
    }
}

extension MyPageDetailViewController: UITableViewDelegate, UITableViewDataSource {
    //numberOfRowsInSection - 한 섹션에 몇개의 셀을 넣을건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedImg.count
    }
    
    //cellForRowAt - 어떠한 셀을 보여줄 것인지? -> FeedTableViewCell 보여줄거임!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.imageViewFeed.image = feedImg[indexPath.row]
        cell.labelFeed.text = feedText[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 600
    }
  }

