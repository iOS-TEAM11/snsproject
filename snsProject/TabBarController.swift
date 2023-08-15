import UIKit

class TabBarController: UITabBarController {

    let imagePickerManager = ImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        self.delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if self.selectedIndex == 1 {
            imagePickerManager.presentImagePicker(from: self)
        }
    }
}
