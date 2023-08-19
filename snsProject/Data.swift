
import UIKit


class DummyData {
    static let shared = DummyData()

    let dummyImage1 = #imageLiteral(resourceName: "dummy1")
    let dummyImage2 = #imageLiteral(resourceName: "dummy2")
    let dummyText1 = "11조 화이팅"
    let dummyText2 = "화이팅팅ㅇㅅㅇ/"
    
    func loadDummyData() {
        DataManager.shared.myFeedImg.append(contentsOf: [dummyImage1, dummyImage2])
        DataManager.shared.myFeedText.append(contentsOf: [dummyText1, dummyText2])
    }
    private init() {}

}

// 게시물 저장 데이터
class DataManager {
    
    //싱글톤 패턴
    static let shared = DataManager()
    
    var myFeedImg: [UIImage] = []
    var myFeedText: [String] = []

    private init() {}
}

//싱글톤으로 선언된 데이터로 통일
//struct Post {
//    let image: UIImage
//    let description: String
//}


// 유저 데이터
struct UserData {
    let userImage: UIImage
    let userName: String
    let userNickName: String
    let userGender: String
    let userIntro: String
    let userLink: String
}
