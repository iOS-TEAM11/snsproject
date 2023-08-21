import UIKit

class DescriptionView: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 15.0)
        tf.placeholder = "게시글을 입력해주세요"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        
        let imageViewInset: CGFloat = 16.0
        let stackView = UIStackView(arrangedSubviews: [imageView, textField])
        stackView.axis = .horizontal
        stackView.spacing = imageViewInset
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: imageViewInset),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: imageViewInset),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: imageViewInset)
        ])
    }
}
