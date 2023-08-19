

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var userId = "iOS_TEAM11 "

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
        //FeedTableViewCell가 생긴걸 viewDidLoad아래에 등록해줘야함 , Nib은 FeedTableViewCell을 의미 ..
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    // 뷰 띄울때 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    
        self.tableView.reloadData()
    }
    
    
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    // numberOfRowsInSection - 한 섹션에 몇개의 셀을 넣을건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.posts.count
    }
    
    // cellForRowAt - 어떠한 셀을 보여줄 것인지? -> FeedTableViewCell 보여줄거임!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.imageViewFeed.image = DataManager.shared.posts[indexPath.row].image
        cell.labelFeed.text = userId + DataManager.shared.posts[indexPath.row].description
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}


extension FeedViewController: FeedTableViewCellDelegate {
    func didTapDeleteButton(in cell: FeedTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        DataManager.shared.posts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func didTapModifyButton(in cell: FeedTableViewCell) {
            guard let indexPath = tableView.indexPath(for: cell) else { return }

            let post = DataManager.shared.posts[indexPath.row]
            let editVC = EditViewController(uploadImage: post.image)
            editVC.indexPath = indexPath.row
            let navController = UINavigationController(rootViewController: editVC)
            present(navController, animated: true)
        }
}
