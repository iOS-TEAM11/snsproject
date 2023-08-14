import UIKit

class TabBarController: UITabBarController, ImagePickerManagerDelegate {

    private let imagePickerManager = ImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerManager.delegate = self
        self.delegate = self
    }
    
    //이미지 선택시 Description 페이지로 이동
    func didPickImage(_ image: UIImage) {
        self.performSegue(withIdentifier: "toDescription", sender: image)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.selectedIndex == 2 {
            imagePickerManager.presentImagePicker(from: self)
        }
    }
}
