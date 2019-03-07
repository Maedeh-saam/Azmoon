class ListModel {
    
    public func GetQuestionsList() -> [QuestionFullClass] {
        let inputs = QuestionDb().Read(QuestionFullClass());
        
        var results = [QuestionFullClass]();
        for item in inputs {
            let temp = QuestionFullClass()
            temp.isOptional = item.is_optional;
            temp.id = Int(item.id!)!;
            temp.number = Int(item.number);
            temp.numberOfOptions = Int(item.number_of_options);
            temp.option1 = item.option1;
            temp.option2 = item.option2;
            temp.option3 = item.option3;
            temp.option4 = item.option4;
            temp.option5 = item.option5;
            temp.option6 = item.option6;
            temp.title = item.title;
            
            results.append(temp);
        }
        
        return results;
    }
    
    public func DeleteQuestionFromList(id: Int) -> Bool {
        
        let result = QuestionDb().Delete(id: id)
        
        return result;
    }
}
