
import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var feedImage: [UIImage] = []
    var feedText: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        //FeedTableViewCell가 생긴걸 viewDidLoad아래에 등록해줘야함 , Nib은 FeedTableViewCell을 의미 ..
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    //이미지 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabController = tabBarController as? TabBarController {
            feedImage = tabController.posts.map { $0.image }
            feedText = tabController.posts.map { $0.description }
            tableView.reloadData()
        }
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
        cell.labelFeed.text = feedText[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 600
    }
  }

