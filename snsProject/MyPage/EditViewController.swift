import UIKit

class EditViewController: UIViewController {
    var indexPath: Int?
    let uploadImage: UIImage
    private let imageView = UIImageView()
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15.0)
        if let indexPath = indexPath, indexPath < DataManager.shared.posts.count {
            textField.text = DataManager.shared.posts[indexPath].description
        }

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

private extension EditViewController {
    func setupNavitagionItem() {
        navigationItem.title = "게시물 편집"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightButton))
    }

    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }

    @objc func didTapRightButton() {
        guard let indexPath = indexPath, indexPath < DataManager.shared.posts.count else{
            dismiss(animated: true)
            return
        }
        DataManager.shared.posts[indexPath].description = textField.text ?? ""

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
