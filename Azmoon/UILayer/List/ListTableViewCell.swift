import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var questionTopic: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
//        
//        let alert = UIAlertController(title: nil, message: "آیا مایل به حذف سوال هستید؟", preferredStyle: .alert)
//        
//        alert.addAction(UIAlertAction(title: "بله", style: .default, handler: nil))
//        alert.addAction(UIAlertAction(title: "خیر", style: .cancel, handler: nil))
//        
//        self.present(alert, animated: true)
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
    }

}
