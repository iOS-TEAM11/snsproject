//
//  MyPage.swift
//  snsProject
//
//  Created by t2023-m0062 on 2023/08/14.
//

import UIKit

class MyPageViewController: UIViewController {
    // 프로퍼티 설정
    @IBOutlet var myPageCollectionView: UICollectionView!

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
    }
}

extension MyPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyPageCollectionViewCell.identifier,
            for: indexPath) as? MyPageCollectionViewCell
        else {
            // return UICollectionViewCell()
            fatalError("cell을 불러오지 못하였습니다")
        }
        return cell
    }
}

extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    { return CGSize(
        width: collectionView.frame.width,
        height: CGFloat(159))
    }
}
