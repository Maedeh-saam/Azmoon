import UIKit
import SwiftIcons

class ListTableViewCell: UITableViewCell {
    
    class var identifier: String { return String.className(self) }
    
    @IBOutlet weak var deleteQuestionButton: UIButton!
    @IBOutlet weak var editQuestionButton: UIButton!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionTopic: UILabel!
    
    
    var cellModel : QuestionFullClass?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.editQuestionButton!.setIcon(icon: .fontAwesomeRegular(.edit), iconSize: 25, color: .blue, forState: .normal)
        
        self.deleteQuestionButton!.setIcon(icon: .ionicons(.trashA), iconSize: 30, color: .blue, forState: .normal)
        
    }
    
    func height() -> CGFloat {
        return UIScreen.main.bounds.width * 117 / 466
    }
    
    func setData(_ data: QuestionFullClass!) {
        
        self.cellModel = data;
        self.questionNumberLabel.text = String(data.number!);
        self.questionTopic.text = data.title
    }
}
