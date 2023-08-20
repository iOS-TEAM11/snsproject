
import UIKit




// 게시물 저장 데이터
class DataManager {
    // 싱글톤 패턴
    static let shared = DataManager()
    
    var posts: [Post] = [
        Post(image: #imageLiteral(resourceName: "dummy1"), description: "iOS개발자가 되고 싶어요"),
        Post(image: #imageLiteral(resourceName: "dummy2"), description: "제발요")
    ]

    private init() {}
}

struct Post {
    let image: UIImage
    var description: String
}

// 유저 데이터
struct UserData {
    let userImage: UIImage
    let userName: String
    let userNickName: String
    let userGender: String
    let userIntro: String
    let userLink: String
}

// 사용자 데이터를 관리하고 저장
class UserDataManager {
    static let shared = UserDataManager()

    var userArray: [UserDatum] = []

    private var userLink: String?

    private init() {
        userLink = UserDefaults.standard.string(forKey: "userLink")
    }

    func addUser(user: UserDatum) {
        userArray.append(user)
    }

    func setUserLink(_ link: String) {
        userLink = link
        UserDefaults.standard.set(link, forKey: "userLink")
    }

    func getUserLink() -> String? {
        return userLink
    }
    
    func resetLink() {
        UserDefaults.standard.removeObject(forKey: "userLink")
    }
}
