public class UserClass {
    var name : String? = nil;
    var familyName : String? = nil;
    var fatherName : String? = nil;
    var nationalCode : Int? = nil;
    var isMan : Bool? = nil;
    var username : String? = nil;
    var password : String? = nil;
    var sendSms : Bool? = nil;
    var phoneNumber : String? = nil;
    
    init(_ name : String?,_ familyName : String?,_ fatherName : String?,_ nationalCode : Int?,_ isMan : Bool?,_ username : String?, _ password : String?, _ sendSms : Bool?, _ phoneNumber : String?) {
        self.name = name;
        self.familyName = familyName;
        self.fatherName = fatherName;
        self.nationalCode = nationalCode;
        self.isMan = isMan;
        self.username = username;
        self.password = password;
        self.sendSms = sendSms;
        self.phoneNumber = phoneNumber;
    }
    
    init(phoneNumber : String) {
        
         self.phoneNumber = phoneNumber;
    }
    
    init(username : String){
        
        self.username = username;
    }
    
    init(){
        
    }
}

public class UserFullClass : UserClass  {
    var id : Int;
    
    override init(username: String){
         self.id = 0;
        super.init(username: username)
        
       
    }
    
    init(id: Int){
        self.id = id;
        
        super.init()
    }
}

public class UserClassSearch {
    var username : String?;
    var phoneNumber : String?;
}

