import UIKit
import BEMCheckBox
import iOSDropDown
import SwiftIcons

class EditQuestionViewController: UIViewController, BEMCheckBoxDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    // MARK: Variables
    var recievedDataQuestion: QuestionFullClass?

    // MARK: - IBOutlets
    @IBOutlet weak var dropdownNumberChoice: DropDown!
    @IBOutlet weak var descriptiveCheckBox: BEMCheckBox!
    @IBOutlet weak var optionalCheckBox: BEMCheckBox!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextView!
    @IBOutlet weak var option1TextField: UITextField!
    @IBOutlet weak var option2TextField: UITextField!
    @IBOutlet weak var option3TextField: UITextField!
    @IBOutlet weak var option4TextField: UITextField!
    @IBOutlet weak var option5TextField: UITextField!
    @IBOutlet weak var option6TextField: UITextField!
    @IBOutlet weak var numberOfOptionsLabel: UILabel!
    @IBOutlet weak var option1Label: UILabel!
    @IBOutlet weak var option2Label: UILabel!
    @IBOutlet weak var option3Label: UILabel!
    @IBOutlet weak var option4Label: UILabel!
    @IBOutlet weak var option5Label: UILabel!
    @IBOutlet weak var option6Label: UILabel!
    
    // MARK: - Variables
    var questionTypeCheckBoxes: [BEMCheckBox]?
    var numberOfOptions: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mark: - Delegates
        descriptiveCheckBox.delegate = self;
        optionalCheckBox.delegate = self;
        questionTypeCheckBoxes = [descriptiveCheckBox,optionalCheckBox];
        
        dropdownNumberChoice.delegate = self
        numberTextField.delegate = self
        titleTextField.delegate = self
        option1TextField.delegate = self
        option2TextField.delegate = self
        option3TextField.delegate = self
        option4TextField.delegate = self
        option5TextField.delegate = self
        option6TextField.delegate = self
        
        // init checkboxes:
        initCheckBoxes()
        
        // init dropdown
        initDropdown()
        
        backButton?.setIcon(icon: .ionicons(.iosArrowBack), iconSize: 30, color: .blue, forState: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(recievedDataQuestion != nil){
            numberTextField.text = String(recievedDataQuestion!.number!)
            titleTextField.text = recievedDataQuestion!.title
            optionalCheckBox.on = (recievedDataQuestion!.isOptional)!
            descriptiveCheckBox.on = !(recievedDataQuestion!.isOptional)!
            numberOfOptions = recievedDataQuestion!.numberOfOptions
            option1TextField.text = recievedDataQuestion!.option1
            option2TextField.text = recievedDataQuestion!.option2
            option3TextField.text = recievedDataQuestion!.option3
            option4TextField.text = recievedDataQuestion!.option4
            option5TextField.text = recievedDataQuestion!.option5
            option6TextField.text = recievedDataQuestion!.option6
            
            dropdownNumberChoice.text = String(numberOfOptions!);
            HideShowByDropdown(recievedDataQuestion!.numberOfOptions!)
        }
        
        
        
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        
        let currentTag = checkBox.tag
        guard let questionTypeCheckBoxes = questionTypeCheckBoxes else {return}
        
        for item in questionTypeCheckBoxes where item.tag != currentTag {
            item.on = false
        }
        
        if(optionalCheckBox.on){
            
            dropdownNumberChoice.text = nil;
            dropdownNumberChoice.isHidden = false;
            option1TextField.isHidden = false;
            option2TextField.isHidden = false;
            option3TextField.isHidden = false;
            option4TextField.isHidden = false;
            option5TextField.isHidden = false;
            option6TextField.isHidden = false;
            numberOfOptionsLabel.isHidden = false;
            option1Label.isHidden = false;
            option2Label.isHidden = false;
            option3Label.isHidden = false;
            option4Label.isHidden = false;
            option5Label.isHidden = false;
            option6Label.isHidden = false;
        } else {
            
            dropdownNumberChoice.isHidden = true;
            option1TextField.isHidden = true;
            option2TextField.isHidden = true;
            option3TextField.isHidden = true;
            option4TextField.isHidden = true;
            option5TextField.isHidden = true;
            option6TextField.isHidden = true;
            numberOfOptionsLabel.isHidden = true;
            option1Label.isHidden = true;
            option2Label.isHidden = true;
            option3Label.isHidden = true;
            option4Label.isHidden = true;
            option5Label.isHidden = true;
            option6Label.isHidden = true;
        }
        
    }
    
    //MARK: - Actions
    
    @IBAction func backtoList(_ sender: UIButton) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func registraionButton(_ sender: UIButton) {
        let optionalCheckBox = self.optionalCheckBox.on;
        
        let model = QuestionFullClass(recievedDataQuestion!.id, optionalCheckBox, Int(numberTextField.text ?? "0"), numberOfOptions, option1TextField.text ?? "", option2TextField.text ?? "", option3TextField.text ?? "", option4TextField.text ?? "", option5TextField.text ?? "", option6TextField.text ?? "", titleTextField.text ?? "")
        
        
        if(model.number == nil){
            self.view.makeToast("لطفا شماره سوال را وارد کنید", duration: 3.0, position: .center)
            
        } else if(model.title!.isEmpty){
            
            self.view.makeToast("لطفا عنوان سوال را وارد کنید", duration: 3.0, position: .center)
            
        } else if(optionalCheckBox && showToastsOptional(model)){
            // nothing
            
        } else if(EditQuestionModel().SendDataToDb(input: model)){
            
            self.view.makeToast("عملیات افزودن سوال با موفقیت انجام شد", duration: 3.0, position: .center)
            // delay interval()
            gotoMain()
            
        } else {
            self.view.makeToast("عملیات افزودن سوال انجام نشد", duration: 3.0, position: .center)
        }
        
    }
    
    
    // MARK: Private functions
    private func showToastsOptional(_ model:QuestionFullClass) -> Bool{
        
        if (model.numberOfOptions! == 0){
            
            self.view.makeToast("لطفا تعداد گزینه های سوال را مشخص کنید", duration: 3.0, position: .center)
            return true;
            
        } else if (model.numberOfOptions! >= 2){
            
            if(model.option1!.isEmpty){
                
                self.view.makeToast("لطفا گزینه ۱ را وارد کنید", duration: 3.0, position: .center)
                return true;
            } else if(model.option2!.isEmpty){
                
                self.view.makeToast("لطفا گزینه ۲ را وارد کنید", duration: 3.0, position: .center)
                return true;
            }
            
            if(model.numberOfOptions! >= 3){
                
                if(model.option3!.isEmpty){
                    
                    self.view.makeToast("لطفا گزینه ۳ را وارد کنید", duration: 3.0, position: .center)
                    return true;
                }
                
                if(model.numberOfOptions! >= 4){
                    
                    if(model.option4!.isEmpty){
                        
                        self.view.makeToast("لطفا گزینه ۴ را وارد کنید", duration: 3.0, position: .center)
                        return true;
                    }
                    
                    if(model.numberOfOptions! >= 5){
                        
                        if(model.option5!.isEmpty){
                            
                            self.view.makeToast("لطفا گزینه ۵ را وارد کنید", duration: 3.0, position: .center)
                            return true;
                        }
                        
                        if(model.numberOfOptions! >= 6){
                            
                            if(model.option6!.isEmpty){
                                
                                self.view.makeToast("لطفا گزینه ۶ را وارد کنید", duration: 3.0, position: .center)
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }
    
    fileprivate func initCheckBoxes() -> Void {
        questionTypeCheckBoxes = [descriptiveCheckBox,optionalCheckBox];
    }
    
    private func gotoMain() ->Void{
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    fileprivate func HideShowByDropdown(_ id: Int) {
        self.numberOfOptions = id;
        
        self.option1TextField.isHidden = true;
        self.option2TextField.isHidden = true;
        self.option3TextField.isHidden = true;
        self.option4TextField.isHidden = true;
        self.option5TextField.isHidden = true;
        self.option6TextField.isHidden = true;
        self.option1Label.isHidden = true;
        self.option2Label.isHidden = true;
        self.option3Label.isHidden = true;
        self.option4Label.isHidden = true;
        self.option5Label.isHidden = true;
        self.option6Label.isHidden = true;
        
        if(id >= 2){
            self.option1TextField.isHidden = false;
            self.option2TextField.isHidden = false;
            self.option1Label.isHidden = false;
            self.option2Label.isHidden = false;
            
            if(id >= 3){
                self.option3TextField.isHidden = false;
                self.option3Label.isHidden = false;
                
                if(id >= 4){
                    self.option4TextField.isHidden = false;
                    self.option4Label.isHidden = false;
                    
                    if(id >= 5){
                        self.option5TextField.isHidden = false;
                        self.option5Label.isHidden = false;
                        
                        if(id >= 6){
                            self.option6TextField.isHidden = false;
                            self.option6Label.isHidden = false;
                        }
                    }
                }
            }
            
        }
    }
    
    private func initDropdown() -> Void {
        dropdownNumberChoice.optionArray = ["2", "3", "4", "5", "6"];
        dropdownNumberChoice.optionIds = [2,3,4,5,6];
        dropdownNumberChoice.didSelect{(selectedText , index ,id) in
            self.HideShowByDropdown(id)
        }
    }
}
