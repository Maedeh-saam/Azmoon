import UIKit
import BEMCheckBox
import iOSDropDown

class AddViewController: UIViewController {
    @IBOutlet weak var dropdownNumberChoice: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // dropdown init
        dropdownNumberChoice.optionArray = ["1", "2", "3", "4", "5", "6"];
        dropdownNumberChoice.optionIds = [1,2,3,4,5,6];
            dropdownNumberChoice.didSelect{(selectedText , index ,id) in
                print("Selected String: \(selectedText) \n index: \(index)");
        }
        
        
        
        
        // salam
        
    }
    
}
