import UIKit
import SwiftIcons

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
    
    
}

//MARK: Extensions
extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return ListTableViewCell().height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ListTableViewCell
        
        
        //        cell.marketLikeButton.addTarget(self, action: #selector(LikeMarket(button:)), for: .touchUpInside)
        //
        //        cell.marketFollowButton.addTarget(self, action: #selector(FollowMarket(button:)), for: .touchUpInside)
        
        //        let recognizerMarketImage = UITapGestureRecognizer()
        //        recognizerMarketImage.addTarget(self, action: #selector(GotoShopDetail))
        //        cell.bannerImageView.isUserInteractionEnabled = true
        //        cell.bannerImageView.addGestureRecognizer(recognizerMarketImage)
        //
        //        let recognizerMarketName = UITapGestureRecognizer()
        //        recognizerMarketName.addTarget(self, action: #selector(GotoShopDetail))
        //        cell.marketNameLabel.isUserInteractionEnabled = true
        //        cell.marketNameLabel.addGestureRecognizer(recognizerMarketName)
        
    }
    
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recieveClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as! ListTableViewCell
        cell.setData(recieveClasses[indexPath.row])
        return cell
    }
}
