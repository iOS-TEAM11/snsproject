import UIKit

class ImagePickerController: UIViewController {

    private var picker = UIImagePickerController()
    weak var tabController: TabBarController?

    func presentImagePicker() {
        guard let tabController = tabController else { return }
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.modalPresentationStyle = .fullScreen
        tabController.present(picker, animated: true, completion: nil)

    }
}




extension ImagePickerController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImage: UIImage?
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
        } else if let originImage = info[.originalImage] as? UIImage {
            selectedImage = originImage
        }
        
        picker.dismiss(animated: true) { [weak self] in
            guard let tabController = self?.tabController else { return }
            let descriptionViewController = DescriptionViewController(uploadImage: selectedImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: descriptionViewController)
            navigationController.modalPresentationStyle = .fullScreen
            tabController.present(navigationController, animated: true)
        }
    }
}
