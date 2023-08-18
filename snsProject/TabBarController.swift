import UIKit

class TabBarController: UITabBarController {

    var posts: [Post] = []
    var userData: [UserDatum] = []
    
    
    private let imagePickerController = ImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        self.delegate = self
        imagePickerController.tabController = self
        

    }
    
    func uiTabBarSetting() {
            if #available(iOS 15.0, *){
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .white
                tabBar.standardAppearance = appearance
                tabBar.scrollEdgeAppearance = appearance
            }
        }
    
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if self.selectedIndex == 2 {
            imagePickerController.presentImagePicker()
        }
//        if self.selectedIndex == 4 {
            
//        }
    }
}



