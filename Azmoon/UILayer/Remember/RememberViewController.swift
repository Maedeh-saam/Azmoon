import UIKit
import Toast_Swift

class RememberViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.delegate = self;
    }
    
    //MARK: - Actions
    
    @IBAction func sendSms(_ sender: UIButton) {
        
        let model = UserClass.init(phoneNumber: phoneNumberTextField.text ?? "")
        
        if(model.phoneNumber!.isEmpty ){
            
            self.view.makeToast("لطفا شماره تلفن را وارد کنید", duration: 3.0, position: .center)
            
        } else if(RememberModel().NotExistPhoneNumebr(phoneNumber: model.phoneNumber!)){
            
            self.view.makeToast(" این شماره تلفن ثبت نشده است", duration: 3.0, position: .center)
        } else {
            // toast with a specific duration and position
            self.view.makeToast("‍.پیامک ارسال شد", duration: 3.0, position: .center)
        }
        
    }

    @IBAction func returnRemButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
  
    
}

