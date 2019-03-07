import UIKit
import Toast_Swift


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameText.delegate = self;
        passwordText.delegate = self;
        
        
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        
        let username = usernameText.text?.lowercased();
        let password = passwordText.text;
        
        if(username?.isEmpty ?? false || username!.count < 6){
            // toast with a specific duration and position
            self.view.makeToast("لطفا نام کاربری را به درستی وارد کنید", duration: 3.0, position: .center)
            
        } else if(password?.isEmpty ?? false){
            //TODO: toast
            self.view.makeToast("لطفا پسورد را وارد کنید", duration: 3.0, position: .center)
        } else {
            let user = LoginModel().getUser(username: username!)
            if (user == nil){
                //TODO: toast
                self.view.makeToast("کاربری با این اطلاعات وجود ندارد", duration: 3.0, position: .center)
            } else{
                if(user!.password == password){
                    gotoMain();
                }else{
                    //TODO: toast
                }
            }
        }
    }

    
    @IBAction func newMemberButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Register", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func forgetPasswordButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Remember", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RememberViewController") as! RememberViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    private func gotoMain() ->Void{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
