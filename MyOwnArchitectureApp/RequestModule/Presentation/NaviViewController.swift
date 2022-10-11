//
//  Created by Ankur Chaudhary on 10/10/22.
//

// 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

import UIKit


class NaviViewController: UIViewController, StoryboardInitProtocol {
    static let identifier = "NaviViewController"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    weak var requestCoordinator: RequestChildCoordinator?
    var requestViewModel: RequestViewModelProtocol!
    
    class func create(wihViewModel viewModel: RequestViewModel, coordinator: RequestChildCoordinator) ->  NaviViewController {
        let nVC = NaviViewController.instantiateFromStoryBoard()
        nVC.requestViewModel = viewModel
        nVC.requestCoordinator = coordinator
        return nVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        requestViewModel.labelText.bind { text in
            self.titleLabel.text = text
        }

        requestViewModel.requestData.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
}

extension NaviViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.requestViewModel.requestData.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyNaviCell.reuseIdentifier, for: indexPath) as? MyNaviCell else {
            debugPrint("Dequeue error MyNaviCell")
            return UITableViewCell()
        }
        let requestDetail = self.requestViewModel.requestData.value![indexPath.row]
        cell.selectionStyle = .none
        cell.configureCell(requestDetail: requestDetail)
        self.requestViewModel.downloadImage(indexPath: indexPath) { data in
            DispatchQueue.main.async {
                cell.configureImage(forData: data)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let requestDetail = requestViewModel.requestData.value![indexPath.row]
        self.requestCoordinator?.navigateToDetailRequestVC(requestDetail: requestDetail, imageData: requestViewModel.getImageData(indexPath: indexPath))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 150
    }
}
