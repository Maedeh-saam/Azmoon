import UIKit
import SwiftIcons
import Toast_Swift

class UserListViewController: UIViewController {

    @IBOutlet weak var back: UIButton?
    @IBOutlet weak var userListSearchBar: UISearchBar!
    @IBOutlet weak var userListTableView: UITableView!
    
    var recieveClasses = [UserClass]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTableView.delegate = self
        userListTableView.dataSource = self
        self.userListTableView.registerCellNib(UserListTableViewCell.self)
        
        back?.setIcon(icon: .ionicons(.iosArrowBack), iconSize: 30, color: .blue, forState: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recieveClasses = UserListModel().GetUsersList();
        self.userListTableView.reloadData()
    }
    
    
    @IBAction func backtoMain(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @objc
    internal func DeleteUser(button: UIButton) {
        
        var indexPath: IndexPath!
        if let super1viewCell = button.superview{
            if let super2viewCell = super1viewCell.superview as? UserListTableViewCell{
                indexPath = self.userListTableView.indexPath(for: super2viewCell)
            }
        }
        
        let cell = self.userListTableView.cellForRow(at: indexPath!) as! UserListTableViewCell
        
        
        let alert = UIAlertController(title: nil, message: "آیا مایل به حذف کاربر هستید؟", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "بله", style: .default, handler: {(action: UIAlertAction!) in
            
            if(UserListModel().DeleteUserFromList(id: (cell.cellModel?.id)!)){
                
                self.view.makeToast("کاربر مورد نظر با موفقیت حذف شد", duration: 3.0, position: .center)
                self.recieveClasses.remove(at: indexPath.row)
                self.userListTableView.deleteRows(at: [indexPath], with: .automatic)
                
            }else{
                self.view.makeToast("کاربر مورد نظر حذف نشد", duration: 3.0, position: .center)
            }
            
        }))
        alert.addAction(UIAlertAction(title: "خیر", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc
    internal func EditUser(button: UIButton) {
        
        var indexPath: IndexPath!
        if let super1viewCell = button.superview{
            if let super2viewCell = super1viewCell.superview as? UserListTableViewCell{
                indexPath = self.userListTableView.indexPath(for: super2viewCell)
            }
        }
        
        let cell = self.userListTableView.cellForRow(at: indexPath!) as! UserListTableViewCell
        
        gotoEditUser(input: cell.cellModel!);
    }
    
    @objc
    internal func ViewUser(button: UIButton) {
        
        var indexPath: IndexPath!
        if let super1viewCell = button.superview{
            if let super2viewCell = super1viewCell.superview as? UserListTableViewCell{
                indexPath = self.userListTableView.indexPath(for: super2viewCell)
            }
        }
        
        let cell = self.userListTableView.cellForRow(at: indexPath!) as! UserListTableViewCell
        
        gotoViewUser(input: cell.cellModel!);
    }
    
}

//MARK: Extensions
extension UserListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UserListTableViewCell().height()
    }
    
}

extension UserListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recieveClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier) as! UserListTableViewCell
        cell.setData(recieveClasses[indexPath.row] as? UserFullClass)
        
        cell.deleteUserButton.addTarget(self, action: #selector(DeleteUser(button:)), for: .touchUpInside)
        
        cell.editUserButton.addTarget(self, action: #selector(EditUser(button:)), for: .touchUpInside)
        
        cell.viewUserButton.addTarget(self, action: #selector(ViewUser(button:)), for: .touchUpInside)
        
        return cell
    }
    
    private func gotoEditUser(input: UserFullClass) -> Void {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "EditUser", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "EditUserViewController") as! EditUserViewController
        newViewController.recievedDataUser = input;
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    private func gotoViewUser(input: UserFullClass) -> Void {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "ViewUser", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewUserViewController") as! ViewUserViewController
        newViewController.recievedDataUser = input;
        
        self.present(newViewController, animated: true, completion: nil)
    }
    

}
