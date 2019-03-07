import UIKit
import SwiftIcons

class UserListTableViewCell: UITableViewCell {

    class var identifier: String { return String.className(self) }
    
    @IBOutlet weak var viewUserButton: UIButton!
    @IBOutlet weak var deleteUserButton: UIButton!
    @IBOutlet weak var editUserButton: UIButton!
    @IBOutlet weak var personsUsernameLabel: UILabel!
    
    
    var cellModel : UserFullClass?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.editUserButton!.setIcon(icon: .fontAwesomeRegular(.edit), iconSize: 25, color: .blue, forState: .normal)
        
        self.deleteUserButton!.setIcon(icon: .ionicons(.trashA), iconSize: 30, color: .blue, forState: .normal)
        
        self.viewUserButton!.setIcon(icon: .ionicons(.information), iconSize: 30, color: .blue, forState: .normal)
        
    }
    
    func height() -> CGFloat {
        return UIScreen.main.bounds.width * 117 / 342
    }
    
    func setData(_ data: UserFullClass!) {
        
        self.cellModel = data;
        self.personsUsernameLabel.text = data.username
    }
}
