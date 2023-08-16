import UIKit

class TabBarController: UITabBarController {


    private let imagePickerController = ImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        self.delegate = self
        imagePickerController.tabController = self  

    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if self.selectedIndex == 2 {


            imagePickerController.presentImagePicker()
        }
    }
}


