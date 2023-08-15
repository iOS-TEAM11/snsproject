import UIKit

class MyPageViewController: UIViewController {
    // 프로퍼티 설정
    @IBOutlet var myPageCollectionView: UICollectionView!
    
    let myFeedImg: [String] = [
        "https://static.wikia.nocookie.net/shinchan/images/d/d8/Shinnoske.jpg/revision/latest?cb=20131020030755&path-prefix=ko",
        "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA3MTBfMjI2%2FMDAxNjg4OTE3MTc2NjI4.LpXG37XqrD-WVQUTbbrrN0oDmQ5_GnQrtKpzKj0UPUQg.MguCJjlR-8hHcFFJoLo4DfVkPzYOiCDzSuEosxDPrXgg.JPEG.ddongddangg%2FIMG_5446.JPG&type=sc960_832",
        "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MTlfOSAg%2FMDAxNjg3MTAxMDEyMzkz.DmS5Y7_dd4Tj5LtEQOyxzteWF7ndOxoIUdhGxQtcnrYg.vTmHsNJcdQD-bS_xrFPV7FA7cmvSIDSgDG1D64e3m4Ug.PNG.salgudoll%2Fp1.png&type=sc960_832"
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
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
            
            let img = myFeedImg[indexPath.item]
            cell.updateUI(img)
            
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
            let side = CGFloat((collectionView.frame.width / 3) - (4/3)) // 하나의 면의 크기를 같게 하기위해
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
