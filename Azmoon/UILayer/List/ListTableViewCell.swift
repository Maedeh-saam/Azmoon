import UIKit

class ListTableViewCell: UITableViewCell {
    
class var identifier: String { return String.className(self) }
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionTopic: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func height() -> CGFloat {
        return UIScreen.main.bounds.width * 49 / 363
    }
    
    func setData(_ data: Any?) {
        if let data = data as? QuestionClass {
            
            self.questionNumberLabel.text = String(data.number!);
            self.questionTopic.text = data.title
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: "آیا مایل به حذف سوال هستید؟", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "بله", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "خیر", style: .cancel, handler: nil))
        
        let pvc = self.parentViewController as? ListViewController
        pvc!.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
        if let pvc = self.parentViewController as? ListViewController {
            
            
            //TODO Goto Edit
            
            
        }
    }
    
    

}
