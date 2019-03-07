import UIKit
import SwiftIcons
import Toast_Swift

class ListViewController: UIViewController {
    
    @IBOutlet weak var back: UIButton?
    @IBOutlet weak var questionListSearchBar: UISearchBar!
    @IBOutlet weak var questionListTableView: UITableView!
    
    var recieveClasses = [QuestionClass]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionListTableView.delegate = self
        self.questionListTableView.registerCellNib(ListTableViewCell.self)
        
        back?.setIcon(icon: .ionicons(.iosArrowBack), iconSize: 30, color: .blue, forState: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recieveClasses = ListModel().GetQuestionsList();
        self.questionListTableView.reloadData()
    }
    
    
    @IBAction func backtoMain(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @objc
    internal func DeleteQuestion(button: UIButton) {
        
        var indexPath: IndexPath!
        if let superviewCell = button.superview as? ListTableViewCell{
            indexPath = self.questionListTableView.indexPath(for: superviewCell)
        }
        
        let cell = self.questionListTableView.cellForRow(at: indexPath!) as! ListTableViewCell
        
        
        let alert = UIAlertController(title: nil, message: "آیا مایل به حذف سوال هستید؟", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "بله", style: .default, handler: {(action: UIAlertAction!) in
            
            if(ListModel().DeleteQuestionFromList(id: (cell.cellModel?.id)!)){
                
                self.view.makeToast("سوال مورد نظر با موفقیت حذف شد", duration: 3.0, position: .center)
                self.recieveClasses.remove(at: indexPath.row)
                self.questionListTableView.deleteRows(at: [indexPath], with: .automatic)
                
            }else{
                self.view.makeToast("سوال مورد نظر حذف نشد", duration: 3.0, position: .center)
            }
            
        }))
        alert.addAction(UIAlertAction(title: "خیر", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @objc
    internal func EditQuestion(button: UIButton) {
        
        var indexPath: IndexPath!
        if let superviewCell = button.superview as? ListTableViewCell{
            indexPath = self.questionListTableView.indexPath(for: superviewCell)
            
        }
        let cell = self.questionListTableView.cellForRow(at: indexPath!) as! ListTableViewCell
        
        gotoEditQuestion(input: cell.cellModel!);
    }
    
}

//MARK: Extensions
extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return ListTableViewCell().height()
    }
    
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recieveClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as! ListTableViewCell
        cell.setData(recieveClasses[indexPath.row] as? QuestionFullClass)
        
        cell.deleteQuestionButton.addTarget(self, action: #selector(DeleteQuestion(button:)), for: .touchUpInside)
        
        cell.editQuestionButton.addTarget(self, action: #selector(EditQuestion(button:)), for: .touchUpInside)
        
        return cell
    }
    
    private func gotoEditQuestion(input: QuestionFullClass) -> Void {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "EditQuestion", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "EditQuestionViewController") as! EditQuestionViewController
        newViewController.recievedDataQuestion = input;
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
}
