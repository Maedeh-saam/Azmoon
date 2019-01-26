import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        back?.setIcon(icon: .ionicons(.iosArrowBack), iconSize: 30, color: .blue, forState: .normal)
        

        
    }
    
    @IBAction func backtoMain(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
}
