import Foundation

class LoginModel {
      func getUser(username: String) -> UserEntity? {
        var users = UserDb().Read(UserFullClass(username: username));
        if (users.count == 0){
            return nil;
        } else{
            return users[0];
        }
    }
    
}
