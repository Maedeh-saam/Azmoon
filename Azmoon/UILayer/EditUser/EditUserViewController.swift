import UIKit
import BEMCheckBox
import iOSDropDown
import SwiftIcons

class EditUserViewController: UIViewController, BEMCheckBoxDelegate, UITextFieldDelegate {

    // MARK: Variables
    var recievedDataUser: UserFullClass?
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var familyNameTextField: UITextField!
    @IBOutlet weak var fatherNameTextField: UITextField!
    @IBOutlet weak var nationalCodeTextField: UITextField!
    @IBOutlet weak var manCheckBox: BEMCheckBox!
    @IBOutlet weak var womanCheckBox: BEMCheckBox!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var smsCheckBox: BEMCheckBox!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    
    // MARK: - Variables
    var genderCheckBoxes: [BEMCheckBox]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mark: - Delegates
        smsCheckBox.delegate=self;
        manCheckBox.delegate = self;
        womanCheckBox.delegate = self;
        genderCheckBoxes = [manCheckBox,womanCheckBox];
        
        nameTextField.delegate = self
        familyNameTextField.delegate = self
        fatherNameTextField.delegate = self
        nationalCodeTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        phoneNumberTextField.delegate = self
        
        // init checkboxes:
        initCheckBoxes()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(recievedDataUser != nil){
            nameTextField.text = recievedDataUser!.name!
            familyNameTextField.text = recievedDataUser!.familyName
            fatherNameTextField.text = recievedDataUser!.fatherName
            nationalCodeTextField.text = String(recievedDataUser!.nationalCode!)
            manCheckBox.on = (recievedDataUser!.isMan)!
            womanCheckBox.on = !(recievedDataUser!.isMan)!
            usernameTextField.text = recievedDataUser!.username
            passwordTextField.text = recievedDataUser!.password
            phoneNumberTextField.text = recievedDataUser!.phoneNumber
            
        }
        
        
        
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        
        let currentTag = checkBox.tag
        if(currentTag != 3){
            guard let genderCheckBoxes = genderCheckBoxes else {return}
            
            for item in genderCheckBoxes where item.tag != currentTag {
                item.on = false
            }
        }
        
        
    }
    
    //MARK: - Actions
    
    @IBAction func backtoUserList(_ sender: UIButton) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "UserList", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func registraionButton(_ sender: UIButton) {
        let manCheckBox = self.manCheckBox.on;
        let womanCheckBox = self.womanCheckBox.on;
        let smsCheckBox = self.smsCheckBox.on;
        let confirmPassword = self.confirmPasswordTextField.text;
        
        let model = UserFullClass(recievedDataUser!.id, nameTextField.text ?? "", familyNameTextField.text ?? "", fatherNameTextField.text ?? "", Int(nationalCodeTextField.text ?? "0"), manCheckBox, (usernameTextField.text ?? "").lowercased(), passwordTextField.text ?? "", smsCheckBox, phoneNumberTextField.text ?? "")
    

        
        if((model.name!.isEmpty)){
            self.view.makeToast("لطفا نام را وارد کنید", duration: 3.0, position: .center)
            
        } else if(model.familyName!.isEmpty){
            
            self.view.makeToast("لطفا نام خانوادگی را وارد کنید", duration: 3.0, position: .center)
            
        } else if(model.fatherName!.isEmpty){
            
           self.view.makeToast("لطفا نام پدر را وارد کنید", duration: 3.0, position: .center)
            
        } else if(model.nationalCode == 0){
            
            self.view.makeToast("لطفا کد ملی را وارد کنید", duration: 3.0, position: .center)
            
        } else if(manCheckBox == false && womanCheckBox == false){
            
            self.view.makeToast("لطفا جنسیت را وارد کنید", duration: 3.0, position: .center)
            
        } else if(model.username!.isEmpty){
            
            self.view.makeToast("لطفا نام کاربری را وارد کنید", duration: 3.0, position: .center)
            
        } else if(model.username!.count < 6){
            
            self.view.makeToast("نام کاربری نباید کمتر از ۶ کاراکتر باشد", duration: 3.0, position: .center)
        
        } else if(model.password!.isEmpty){
            
            self.view.makeToast("لطفا پسورد را وارد کنید", duration: 3.0, position: .center)
            
        } else if (model.sendSms! && model.phoneNumber!.isEmpty){
            
            self.view.makeToast("لطفا شماره تلفن را وارد کنید", duration: 3.0, position: .center)
            
        } else if(!EditUserModel().AllowNewRegister(username: model.username!, phoneNumber: model.phoneNumber!)){
            self.view.makeToast("نام کاربری یا شماره تلفن قبلا ثبت شده است", duration: 3.0, position: .center)
            
        } else  if (model.password != confirmPassword) {
            self.view.makeToast("عدم تطابق پسورد", duration: 3.0, position: .center)
            
        } else if(EditUserModel().SendDataToDb(input: model)){
            
            self.view.makeToast("ویرایش اطلاعات کاربر با موفقیت انجام شد", duration: 3.0, position: .center)
            // delay interval()
            gotoMain()
            
        } else {
            self.view.makeToast("ویرایش اطلاعات کاربر انجام نشد", duration: 3.0, position: .center)
        }
        
    }
    
    
    // MARK: Private functions
    
    fileprivate func initCheckBoxes() -> Void {
        genderCheckBoxes = [manCheckBox,womanCheckBox];
    }
    
    private func gotoMain() ->Void{
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
    }

}
