import UIKit


//UIImagePickerController는 UINavigationController를 확장하기 위해 NSObject 채태
class ImagePickerManager: UIImagePickerController {

    // image picker를 보여주는 함수
    func presentImagePicker(from viewController: UIViewController) {
        self.sourceType = .photoLibrary
        self.allowsEditing = true
        viewController.present(self, animated: true, completion: nil)
    }
}


// 이미지 선택 이후 뷰 띄우기는 UIImagePickerControllerDelegate, UINavigationControllerDelegate 메서드가 필요한 부분
extension ImagePickerManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
}







