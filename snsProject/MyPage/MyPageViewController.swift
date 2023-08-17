import UIKit

class MyPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // 프로퍼티 설정
    @IBOutlet var myPageCollectionView: UICollectionView!
    
    var myFeedImg: [UIImage] = []
    var index = 0


    let collectionView = MyPageCollectionViewCell()

    //인스턴스가 만들어질 때 실행되는 녀석
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    //뷰 띄울때 데이터 업데이트
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabController = tabBarController as? TabBarController {
            myFeedImg = tabController.posts.map { $0.image }
            
            myPageCollectionView.reloadData()
        }
    }
    
    

    
    // Segue가 실행되기 전에 데이터를 전달하거나 추가 설정을 할 수 있습니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GotoDetailPage",
           let selectedRowIndex = sender as? Int,
           let myPageDetailViewController = segue.destination as? MyPageDetailViewController {
            
            // indexPath.row 값을 이용하여 데이터 가져오기
            let selectedImg = myFeedImg[selectedRowIndex]
            
            // 다음 페이지의 ViewController에 데이터 전달
            myPageDetailViewController.selectedImage = selectedImg
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        
        performSegue(withIdentifier: "GotoDetailPage", sender: nil)
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
            else {
                fatalError("cell을 불러오지 못하였습니다")
            }
            
            cell.parentViewController = self
            
            return cell
            
            
        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PostCollectionViewCell.identifier,
                for: indexPath) as? PostCollectionViewCell
            else {
                fatalError("cell을 불러오지 못하였습니다")
            }
            
            //데이터가져오기
            let img = myFeedImg[indexPath.item]
            print(myFeedImg.count)
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
