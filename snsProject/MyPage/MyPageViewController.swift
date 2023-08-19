import UIKit

class MyPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 프로퍼티 설정
    @IBOutlet var myPageCollectionView: UICollectionView!
    
    var longPressGesture: UILongPressGestureRecognizer! // 길게 누르기 동작

    let collectionView = MyPageCollectionViewCell()

    // 인스턴스가 만들어질 때 실행되는 녀석
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // 뷰 띄울때 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        myPageCollectionView.addGestureRecognizer(longPressGesture)
        if let tabController = tabBarController as? TabBarController {
//            DataManager.shared.myFeedImg = tabController.posts.map { $0.image }
            myPageCollectionView.reloadData()
        }
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            // 꾹 눌린 동작이 시작되었을 때
            let touchPoint = gestureRecognizer.location(in: myPageCollectionView)
            if let indexPath = myPageCollectionView.indexPathForItem(at: touchPoint) {
                showActionButtons(at: indexPath)
            }
        }
    }
    
    // 수정하기 클릭시 작동되는 함수
    func showEditViewController(at indexPath: IndexPath) {
        let editViewController = EditViewController(uploadImage: DataManager.shared.posts[indexPath.row].image)
        editViewController.indexPath = indexPath.row
        
        let navigationController = UINavigationController(rootViewController: editViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        present(navigationController, animated: true, completion: nil)
    }
    

    func showActionButtons(at indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           
        let editAction = UIAlertAction(title: "수정하기", style: .default) { [weak self] _ in
            // 수정하기 구현
            self?.showEditViewController(at: indexPath)
        }
           
        let deleteAction = UIAlertAction(title: "삭제하기", style: .destructive) { [weak self] _ in
            // 삭제하기 구현
            DataManager.shared.posts.remove(at: indexPath.row)
            self?.myPageCollectionView.reloadData()
        }
           
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
           
        alert.addAction(editAction)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
           
        present(alert, animated: true, completion: nil)
    }

    // 메소드 설정
    private func setupCollectionView() {
        // delegate 연결
        myPageCollectionView.delegate = self
        myPageCollectionView.dataSource = self

        // cell 등록
        myPageCollectionView.register(
            UINib(nibName: "MyPageCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: MyPageCollectionViewCell.identifier)

        // postCell 등록
        myPageCollectionView.register(
            UINib(nibName: "PostCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }
}

extension MyPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GotoDetailPage",
           let detailVC = segue.destination as? MyPageDetailViewController,
           let indexPath = sender as? Int
        {
            // detailVC.selectedImage = DataManager.shared.posts[indexPath].image
            detailVC.selectedIndexPath = indexPath
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // print("index!!!: \(indexPath.row)")
        
        performSegue(withIdentifier: "GotoDetailPage", sender: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return DataManager.shared.posts.count
        }
    }

    // cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyPageCollectionViewCell.identifier,
                for: indexPath) as? MyPageCollectionViewCell
            else {
                fatalError("cell을 불러오지 못하였습니다")
            }
            
            cell.parentViewController = self
            cell.postingCountLabel.text = String(DataManager.shared.posts.count)

            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PostCollectionViewCell.identifier,
                for: indexPath) as? PostCollectionViewCell
            else {
                fatalError("cell을 불러오지 못하였습니다")
            }
            
            // 데이터가져오기
            let img = DataManager.shared.posts[indexPath.item].image
            // print(myFeedImg.count)
            cell.setPostImage(img)

            return cell
        }
    }
}

extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let section = indexPath.section
        switch section {
        case 0:
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(159))
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4 / 3)) // 하나의 면의 크기를 같게 하기위해
            return CGSize(
                width: side,
                height: side)
        }
    }

    // 행
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }

    // 열
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}
