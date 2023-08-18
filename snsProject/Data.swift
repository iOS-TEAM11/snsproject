
import UIKit

// 게시물 저장 데이터
class DataManager {
    //싱글톤 패턴
    static let shared = DataManager()
    var posts: [Post] = []
    
    private init() {
        
    }
}


struct Post {
    let image: UIImage 
    let description: String
}


// 유저 데이터
struct UserDatum {
    let userImage: UIImage
    let userName: String
    let userNickName: String
    let userGender: String
    let userIntro: String
    let userLink: String
}
