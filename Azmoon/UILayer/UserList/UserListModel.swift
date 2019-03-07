class UserListModel {
    
    public func GetUsersList() -> [UserFullClass] {
        let inputs = UserDb().Read(UserFullClass())
        var results = [UserFullClass]();
        for item in inputs {
            let temp = UserFullClass()
            temp.name = item.name;
            temp.familyName = item.family_name;
            temp.fatherName = item.father_name;
            temp.nationalCode = Int(item.national_code);
            temp.isMan = item.is_man;
            temp.username = item.username;
            temp.password = item.password;
            temp.sendSms = item.send_sms;
            temp.phoneNumber = item.phone_number;
            temp.id = Int(item.id);
            
            results.append(temp);
        }
        
        return results;
    }
    
    public func DeleteUserFromList(id: Int) -> Bool {
        
        let result = UserDb().Delete(id: id)
        
        return result;
    }
}
