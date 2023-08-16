import UIKit

//protocol ImagePickerManagerDelegate: AnyObject {
//    func didPickImage(_ image: UIImage)
//}

class MyPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 프로퍼티 설정
    @IBOutlet var myPageCollectionView: UICollectionView!
    
    var myFeedImg: [UIImage] = []

    let collectionView = MyPageCollectionViewCell()


    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabController = tabBarController as? TabBarController {
            myFeedImg = tabController.posts.map { $0.image }
            print(myFeedImg.count)  // This should print the number of images

        }
        setupCollectionView()
    }
    
    //뷰 띄울때 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myPageCollectionView.reloadData()
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return myFeedImg.count
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

            //cell.myPageImageView
            else {
                // return UICollectionViewCell()
                fatalError("cell을 불러오지 못하였습니다")
            }
            return cell
            
            
        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PostCollectionViewCell.identifier,
                for: indexPath) as? PostCollectionViewCell
            else {
                // return UICollectionViewCell()
                fatalError("cell을 불러오지 못하였습니다")
            }
            
            //데이터가져오기
            let img = myFeedImg[indexPath.item]
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
