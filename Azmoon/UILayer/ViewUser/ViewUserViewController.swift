import UIKit
import BEMCheckBox
import iOSDropDown
import SwiftIcons

class ViewUserViewController: UIViewController {

    // MARK: Variables
    var recievedDataUser: UserFullClass?
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var fatherNameLabel: UILabel!
    @IBOutlet weak var nationalCodeLabel: UILabel!
    @IBOutlet weak var manCheckBoxLabel: UILabel!
    @IBOutlet weak var womanCheckBoxLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var smsCheckBoxLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberSticker: UILabel!
    
    
    // MARK: - Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(recievedDataUser != nil){
            nameLabel.text = recievedDataUser!.name!
            familyNameLabel.text = recievedDataUser!.familyName
            fatherNameLabel.text = recievedDataUser!.fatherName
            nationalCodeLabel.text = String(recievedDataUser!.nationalCode!)
            usernameLabel.text = recievedDataUser!.username
            passwordLabel.text = recievedDataUser!.password
            phoneNumberLabel.text = recievedDataUser!.phoneNumber
            
            if(recievedDataUser?.isMan == true){
                
                manCheckBoxLabel.setIcon(icon: .ionicons(.checkmark) , iconSize: 30, color: .blue, bgColor: .white)
                womanCheckBoxLabel.isHidden = true
                
            } else {
                
                womanCheckBoxLabel.setIcon(icon: .ionicons(.checkmark) , iconSize: 30, color: .blue, bgColor: .white)
                manCheckBoxLabel.isHidden = true
                
            }
            
            if(recievedDataUser?.sendSms == true){
                
                smsCheckBoxLabel.setIcon(icon: .ionicons(.checkmark) , iconSize: 30, color: .blue, bgColor: .white)
            } else {
                
                smsCheckBoxLabel.isHidden = true
                phoneNumberLabel.isHidden = true
                phoneNumberSticker.isHidden = true
                
                
            }
            
        }
        
        
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func backtoUserList(_ sender: UIButton) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "UserList", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
}
