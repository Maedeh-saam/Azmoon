import Foundation

class RememberModel{
    
    public func NotExistPhoneNumebr (phoneNumber: String) -> Bool {
        
        let result = UserDb().IsNotExistPhoneNumber(phoneNumber: phoneNumber)
        
        return result;
    }
}
