//
//  Created by Ankur Chaudhary on 10/10/22.
//

import UIKit

class RequestDetailViewController: UIViewController, StoryboardInitProtocol {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var closedDateLabel: UILabel!
 
    private var detailViewModel : RequestDetailViewModel!

    class func create(detailViewModel: RequestDetailViewModel) -> RequestDetailViewController {
        let detailVC = RequestDetailViewController.instantiateFromStoryBoard()
        detailVC.detailViewModel = detailViewModel
        return detailVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImageView.image = UIImage.init(named: "defaultPlaceholder")
//        setUpViews()
        detailViewModel.requestDetail.bind { [unowned self] requestDetail in
            self.titleLabel.text = requestDetail?.user.name
            self.descriptionLabel.text = requestDetail?.title
            if let createdDate = requestDetail?.createdDate {
                self.createdDateLabel.text = "Created Date:  \(createdDate)"
            }
            
            if let closedDate = requestDetail?.closedDate {
                self.closedDateLabel.text = "Closed Date:  \(closedDate)"
            }
       }
        
        detailViewModel.data.bind {[unowned self] data in
            if let imgdata = data as? Data, let image = UIImage(data: imgdata) {
                self.detailImageView.image =  image
            }
        }
        // Do any additional setup after loading the view.
    }

//    func setUpViews() {
//        self.newsTitleLabel.text = detailViewModel?.requestDetail.value?.user.name
//        self.newsDetailLabel.text =  detailViewModel?.requestDetail.value?.title
//        if let data = detailViewModel.data?.value, let image = UIImage(data: data) {
//            self.newsImageView.image =  image
//        }
//
//    }
    
    deinit {
        print("De-init \(String(describing: self)) ****")
    }
}
