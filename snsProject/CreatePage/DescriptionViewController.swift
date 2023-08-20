import UIKit

class DescriptionViewController: UIViewController {
    let uploadImage: UIImage
    private let imageView = UIImageView()
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15.0)
        textField.placeholder = "게시글을 입력해주세요"

        return textField
    }()

    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavitagionItem()
        setupLayout()
        imageView.image = uploadImage
    }
}

private extension DescriptionViewController {
    func setupNavitagionItem() {
        navigationItem.title = "게시물 등록"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightButton))
    }

    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }

    @objc func didTapRightButton() {
        let post = Post(image: uploadImage, description: textField.text ?? "")
        print("post: \(post)")

        DataManager.shared.posts.insert(post, at: 0)
        print("post == \(DataManager.shared.posts)")
        dismiss(animated: true)
    }

    func setupLayout() {
        let imageViewInset: CGFloat = 16.0

        // Create the UIStackView
        let stackView = UIStackView(arrangedSubviews: [imageView, textField])
        stackView.axis = .horizontal
        stackView.spacing = imageViewInset
        stackView.alignment = .fill
        stackView.distribution = .fill
        view.addSubview(stackView)

        // Disable autoresizing masks
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        // Constraints for imageView
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
        ])

        // Constraints for stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: imageViewInset),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: imageViewInset),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: imageViewInset),

        ])
    }
}
