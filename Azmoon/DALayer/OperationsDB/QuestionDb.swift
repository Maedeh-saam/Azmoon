import Foundation
import CoreData
import UIKit

public class QuestionDb{
    
    // MARK: Insert Method
    public func Insert (input: QuestionClass) ->  Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        let entity =  NSEntityDescription.entity(forEntityName: "QuestionEntity", in: context)
        let item = NSManagedObject(entity: entity!, insertInto: context);
        
        item.setValue(0, forKey: "id")
        item.setValue(input.title, forKey: "title")
        item.setValue(input.number, forKey: "number")
        item.setValue(input.numberOfOptions, forKey: "number_of_options")
        item.setValue(input.isOptional, forKey: "is_optional")
        item.setValue(input.option1, forKey: "option1")
        item.setValue(input.option2, forKey: "option2")
        item.setValue(input.option3, forKey: "option3")
        item.setValue(input.option4, forKey: "option4")
        item.setValue(input.option5, forKey: "option5")
        item.setValue(input.option6, forKey: "option6")

        var result = true;
        do {
            try context.save()
        } catch {
            result = false;
        }
        return result;
    }
    
    // MARK: Read Method
    public func Read (input: QuestionFullClass) ->  [QuestionEntity] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<QuestionEntity>(entityName: "QuestionEntity")
        if(input.title != nil) {
            request.predicate = NSPredicate(format: "title == %@", input.title!)
        }
        if(input.number != nil) {
        request.predicate = NSPredicate(format: "number == %@", input.number ?? 0)
        }
        if(input.numberOfOptions != nil) {
        request.predicate = NSPredicate(format: "number_of_options == %@", input.numberOfOptions ?? 0)
        }
        if(input.isOptional != nil) {
        request.predicate = NSPredicate(format: "is_optional == %@", input.isOptional ?? true)
        }
        if(input.option1 != nil) {
            request.predicate = NSPredicate(format: "option1 == %@", input.option1!)
        }
        if(input.option2 != nil) {
            request.predicate = NSPredicate(format: "option2 == %@", input.option2!)
        }
        if(input.option3 != nil) {
            request.predicate = NSPredicate(format: "option3 == %@", input.option3!)
        }
        if(input.option4 != nil) {
            request.predicate = NSPredicate(format: "option4 == %@", input.option4!)
        }
        if(input.option5 != nil) {
            request.predicate = NSPredicate(format: "option5 == %@", input.option5!)
        }
        if(input.option6 != nil) {
            request.predicate = NSPredicate(format: "option6 == %@", input.option6!)
        }
        
        
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            return result;
        } catch {
            return [QuestionEntity]();
        }
    }
    
    // MARK: Update Method
    public func Update (input: QuestionFullClass) ->  Bool {
        let dResult = Delete(id: input.id);
        if(dResult){
            let iResult = Insert(input: input)
            return iResult;
        }
        return false;
    }
    
    // MARK: Delete Method
    public func Delete (id: Int) ->  Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        
        let request = NSFetchRequest<QuestionEntity>(entityName: "QuestionEntity")
        request.predicate = NSPredicate(format: "id == %@", id)
        request.returnsObjectsAsFaults = false
        
            if let searchResults = try? context.fetch(request) {
                for object in searchResults {
                    context.delete(object)
                }
            }
            
            return true;
}
    
}

