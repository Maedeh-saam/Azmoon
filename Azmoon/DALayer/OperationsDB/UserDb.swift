import Foundation
import CoreData
import UIKit

public class UserDb{
    func Insert(input: UserClass) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        var idNum = 0;
        
        // get last record of table - one by one
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        let sort = NSSortDescriptor(key: "id", ascending: false)
        request.sortDescriptors = [sort]
        request.fetchLimit = 1
        
        do {
            let result = try context.fetch(request)
            if(result.count == 0){
                idNum = 1;
            } else{
                let lastRecord = result[0];
                idNum = Int(lastRecord.id + 1);
            }
        } catch {
            return false;
        }
        
        
        let entity =  NSEntityDescription.entity(forEntityName: "UserEntity", in: context)
        let item = NSManagedObject(entity: entity!, insertInto: context);
        
        item.setValue(idNum, forKey: "id")
        item.setValue(input.name, forKey: "name")
        item.setValue(input.familyName, forKey: "family_name")
        item.setValue(input.fatherName, forKey: "father_name")
        item.setValue(input.isMan, forKey: "is_man")
        item.setValue(input.nationalCode, forKey: "national_code")
        item.setValue(input.username, forKey: "username")
        item.setValue(input.password, forKey: "password")
        item.setValue(input.sendSms, forKey: "send_sms")
        item.setValue(input.phoneNumber, forKey: "phone_number")

        
        var result = true;
        do {
            try context.save()
        } catch {
            result = false;
        }
        return result;
    }
    
    // MARK: Read Method
    public func Read (_ input: UserFullClass) ->  [UserEntity] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        if(input.id != 0) {
            request.predicate = NSPredicate(format: "id == %@", input.id)
        }
        if(input.name != nil) {
            request.predicate = NSPredicate(format: "name == %@", input.name!)
        }
        if(input.familyName != nil) {
            request.predicate = NSPredicate(format: "family_name == %@", input.familyName!)
        }
        if(input.fatherName != nil) {
            request.predicate = NSPredicate(format: "father_name == %@", input.fatherName!)
        }
        if(input.isMan != nil) {
            request.predicate = NSPredicate(format: "is_man == %@", input.isMan ?? true)
        }
        if(input.nationalCode != nil) {
            request.predicate = NSPredicate(format: "national_code == %d", input.nationalCode ?? 0)
        }
        if(input.username != nil) {
            request.predicate = NSPredicate(format: "username == %@", input.username!)
        }
        if(input.password != nil) {
            request.predicate = NSPredicate(format: "password == %@", input.password!)
        }
        if(input.sendSms != nil) {
            request.predicate = NSPredicate(format: "send_sms == %@", input.sendSms ?? true)
        }
        if(input.phoneNumber != nil) {
            request.predicate = NSPredicate(format: "phone_number == %@", input.phoneNumber ?? true)
        }
        
        
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            return result;
        } catch {
            return [UserEntity]();
        }
    }
    
    public func IsNotExistUsername (username: String) ->  Bool {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        request.predicate = NSPredicate(format: "username == %@", username)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            
            if(result.count >= 1){
                return false
            }
            return true;
        } catch {
            return false;
        }
    }
    
    // MARK: Update Method
    public func Update (input: UserFullClass) ->  Bool {
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
        
        
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        request.predicate = NSPredicate(format: "id == %@", id)
        request.returnsObjectsAsFaults = false
        
        if let searchResults = try? context.fetch(request) {
            for object in searchResults {
                context.delete(object)
            }
        }
        
        return true;
    }
    
    public func IsNotExistPhoneNumber (phoneNumber: String) ->  Bool {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        request.predicate = NSPredicate(format: "phone_number == %@", phoneNumber)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            
            if(result.count >= 1){
                return false
            }
            return true;
        } catch {
            return false;
        }
    }

}
