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
    
    init(isOptional : Bool?, number : Int?, numberOfOptions : Int?, option1 : String?, option2 : String?, option3 : String?, option4 : String?, option5 : String?, option6 : String?, title: String?) {
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
    var id : Int;
    
    init(id: Int){
        self.id = id;
        
        super.init()
    }
    
    
}


