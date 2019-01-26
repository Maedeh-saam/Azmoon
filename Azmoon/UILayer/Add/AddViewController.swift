import UIKit
import BEMCheckBox
import iOSDropDown

class AddViewController: UIViewController, BEMCheckBoxDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegates
        descriptiveCheckBox.delegate = self;
        optionalCheckBox.delegate = self;
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
    
    // MARK: - Variables
    
    var questionTypeCheckBoxes: [BEMCheckBox]?
    
  

    
    func didTap(_ checkBox: BEMCheckBox) {
        
        let currentTag = checkBox.tag
        guard let questionTypeCheckBoxes = questionTypeCheckBoxes else {return}
        
        for item in questionTypeCheckBoxes where item.tag != currentTag {
            item.on = false
        }
        
    }
    
    //MARK: - Actions
    
    @IBAction func backtoMain(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
    // MARK: Private functions
    func initCheckBoxes() -> Void {
        questionTypeCheckBoxes = [descriptiveCheckBox,optionalCheckBox];
        optionalCheckBox.on = true;
    }
    
    func initDropdown() -> Void {
        dropdownNumberChoice.optionArray = ["1", "2", "3", "4", "5", "6"];
        dropdownNumberChoice.optionIds = [1,2,3,4,5,6];
        dropdownNumberChoice.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)");
        }
    }
}
