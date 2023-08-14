import UIKit

//프로토콜 채택시 이미지 선택 정보 수신
protocol ImagePickerManagerDelegate: AnyObject {
    
    // 이미지가 선택될시 알림(정보 업데이트) 역할
    func didPickImage(_ image: UIImage)
}

//UIImagePickerController는 UINavigationController의 하위 클래스이기 때문에 채택
class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //UIImagePickerController 인스턴스 만들기
    private var picker = UIImagePickerController()

    //메서드 사용을 위한 프로토콜 인스턴스 만들기 및 메모리 누수 방지를 위한 weak 선언
    weak var delegate: ImagePickerManagerDelegate?

    //UIViewController인스턴스 만들기
    weak var presentationController: UIViewController?

    // image picker를 보여주는 함수
    func presentImagePicker(from viewController: UIViewController) {
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.presentationController = viewController
        viewController.present(picker, animated: true, completion: nil)
    }

    // 이미지 피킹이후 실행되는 함수
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //이미지 수정했으면 info딕셔너리로 상수에 담기
        if let editedImage = info[.editedImage] as? UIImage {
            delegate?.didPickImage(editedImage)
        }
        
        //이미지 피커 닫기
        presentationController?.dismiss(animated: true, completion: nil)
    }
}

//MARK: 이후에 아래 함수로 선택된 이미지 끌어다 사용가능
/*
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    // Extract the edited image from the dictionary.
    if let editedImage = info[.editedImage] as? UIImage {
        delegate?.didPickImage(editedImage)  // Inform the delegate (MainViewController) about the selected image.
    }
    presentationController?.dismiss(animated: true, completion: nil)  // Dismiss the picker.
}
*/
