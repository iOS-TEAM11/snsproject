import UIKit

class DescriptionViewController: UIViewController {

    private let uploadImage: UIImage
    private let customView = DescriptionView()
    private let feedVC = FeedViewController()
    weak var tabController: TabBarController?

    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.imageView.image = uploadImage
        setupNavitagionItem()
    }

    private func setupNavitagionItem() {
        navigationItem.title = "게시물 등록"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightButton))
    }

    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }

    @objc func didTapRightButton() {
        let post = Post(image: uploadImage, description: customView.textField.text ?? "")
        DataManager.shared.posts.insert(post, at: 0)
        dismiss(animated: true)
    }
}
