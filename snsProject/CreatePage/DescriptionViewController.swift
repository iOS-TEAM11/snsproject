





import UIKit

class DescriptionViewController: UIViewController {
    
    
    let uploadImage: UIImage
    private let imageView = UIImageView()
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        return textView
    }()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        dismiss(animated: true)
    }
    
    func setupLayout() {
        let imageViewInset: CGFloat = 16.0

        // Create the UIStackView
        let stackView = UIStackView(arrangedSubviews: [imageView, textView])
        stackView.axis = .horizontal
        stackView.spacing = imageViewInset
        stackView.alignment = .fill
        stackView.distribution = .fill
        view.addSubview(stackView)

        // Disable autoresizing masks
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        // Constraints for imageView
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Constraints for stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: imageViewInset),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: imageViewInset),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: imageViewInset),

        ])
    }


    
}
