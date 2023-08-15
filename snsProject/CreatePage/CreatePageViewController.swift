import UIKit


//UIImagePickerController는 UINavigationController의 하위 클래스이기 때문에 채택
class ImagePickerManager {

    //UIImagePickerController 인스턴스 만들기
    private var picker = UIImagePickerController()

    //UIViewController인스턴스 만들기
    weak var presentationController: UIViewController?

    // image picker를 보여주는 함수
    func presentImagePicker(from viewController: UIViewController) {
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.presentationController = viewController
        viewController.present(picker, animated: true, completion: nil)
    }
}





