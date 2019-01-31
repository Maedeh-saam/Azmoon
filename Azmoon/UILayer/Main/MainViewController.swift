import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var AddButtonPic: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        AddButtonPic.setIcon(icon: .openIconic(.clipboard), iconSize: 70, color: .orange, forState: .normal)
    }
    
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Add", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func addQuestion(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Add", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: "آیا مایل به خروج از برنامه هستید؟", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "بله", style: .default , handler: {(action: UIAlertAction!) in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(newViewController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "خیر", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    
    @IBAction func listButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func list(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "List", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController")
            as! ListViewController
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func reportButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Report", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ReportViewController") as! ReportViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func reports(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Report", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ReportViewController") as! ReportViewController
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "AnsQuestions", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AnsQuestionsViewController") as! AnsQuestionsViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func answering(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "AnsQuestions", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AnsQuestionsViewController") as! AnsQuestionsViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
}
