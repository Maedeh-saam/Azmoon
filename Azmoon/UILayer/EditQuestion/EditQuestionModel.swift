import Foundation

class EditQuestionModel{
    
    
    public func SendDataToDb(input: QuestionFullClass)  -> Bool {
        
        let result = QuestionDb().Update(input: input)
        
        return result;
    }
}
