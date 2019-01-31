import Foundation

public class QuestionClass {
    var isOptional : Bool? = nil;
    var number : Int? = nil;
    var numberOfOptions : Int? = nil;
    var option1 : String? = nil;
    var option2 : String? = nil;
    var option3 : String? = nil;
    var option4 : String? = nil;
    var option5 : String? = nil;
    var option6 : String? = nil;
    var title : String? = nil;
    
    init(_ isOptional : Bool?,_ number : Int?,_ numberOfOptions : Int?,_ option1 : String?,_ option2 : String?,_ option3 : String?,_ option4 : String?,_ option5 : String?,_ option6 : String?,_ title: String?) {
        self.isOptional = isOptional;
        self.number = number;
        self.numberOfOptions = numberOfOptions;
        self.option1 = option1;
        self.option2 = option2;
        self.option3 = option3;
        self.option4 = option4;
        self.option5 = option5;
        self.option6 = option6;
        self.title = title;
        
    }
    
    init(){
        
    }
  
    
}

public class QuestionFullClass : QuestionClass  {
    var id : Int = 0;
    
    init(id: Int){
        self.id = id;
        
        super.init()
    }
    
    override init() {
        super.init()
    }
    
}


