import Foundation

class EditUserModel{
    
    
    public func AllowNewRegister(username: String, phoneNumber: String) -> Bool {
        
        let result1 = UserDb().IsNotExistUsername(username: username)
        let result2 = UserDb().IsNotExistPhoneNumber(phoneNumber: phoneNumber)
        
        return result1 && result2;
    }
    
    public func SendDataToDb(input: UserFullClass)  -> Bool {
        
        let result = UserDb().Update(input: input)
        
        return result;
    }
}
