//import UIKit
//
//class DescriptionViewController: UIViewController {
//
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var descriptionTextView: UITextView!
//
//    var selectedImage: UIImage?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Setting up the image and navigation bar buttons.
//        imageView.image = selectedImage
//        setupNavigationBar()
//    }
//
//    private func setupNavigationBar() {
//        // Set title for the screen
//        self.title = "New Post"
//
//        // Left button - "Change Image"
//        let changeImageButton = UIBarButtonItem(title: "Change", style: .plain, target: self, action: #selector(changeImageTapped))
//        self.navigationItem.leftBarButtonItem = changeImageButton
//
//        // Right button - "Save" or "Post"
//        let saveButton = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(savePostTapped))
//        self.navigationItem.rightBarButtonItem = saveButton
//    }
//
//    @objc func changeImageTapped() {
//        // Call the image picker again to allow user to re-select an image.
//        // For this, we'll assume that the TabBarController is the parent.
//        if let tabBarController = self.navigationController?.viewControllers.first as? TabBarController {
//            tabBarController.imagePickerManager.presentImagePicker(from: tabBarController)
//        }
//    }
//
//    @objc func savePostTapped() {
//        guard let image = selectedImage, let description = descriptionTextView.text else { return }
//        // Save to CoreData or any other storage you are using.
//        // After saving, you can navigate back or show a confirmation message.
//
//        // For now, let's just pop this view controller.
//        self.navigationController?.popViewController(animated: true)
//    }
//}
