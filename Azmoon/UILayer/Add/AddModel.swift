import Foundation

class AddModel{
    
    
    public func SendDataToDb(input: QuestionClass)  -> Bool {
        
        let result = QuestionDb().Insert(input: input)
        
        return result;
    }
    
}
