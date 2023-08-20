import UIKit

class MyPageDetailViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var userId = "iOS_TEAM11 "

    var selectedIndexPath: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 데이터 확인: \(DataManager.shared.posts.count)")

        tableView.delegate = self
        tableView.dataSource = self
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let indexPath = IndexPath(row: selectedIndexPath!, section: 0)
        tableView.scrollToRow(at: indexPath, at: .none, animated: true)

        tableView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        // 다른 tabBar icon을 누를 시, 강제로 view 빼주기
        navigationController?.popViewController(animated: true)
    }
}

extension MyPageDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }

        cell.imageViewFeed.image = DataManager.shared.posts[indexPath.row].image
        // cell.labelFeed.text = userId + DataManager.shared.posts[indexPath.row].description
        cell.labelFeed.text = DataManager.shared.posts[indexPath.row].description
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
