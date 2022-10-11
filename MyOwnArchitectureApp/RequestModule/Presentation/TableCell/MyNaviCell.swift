//
//  MyNaviCell.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 11/10/22.
//

import Foundation
import UIKit

class MyNaviCell: UITableViewCell {
    
    static let reuseIdentifier = "MyNaviCell"

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
  
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imgView.image = nil
        self.imgView.layer.cornerRadius = 5
        self.imgView.layer.masksToBounds = true
    }
    
    func configureCell(requestDetail: RequestDetail) {
        self.titleLabel.text = requestDetail.user.name
        self.descriptionLabel.text = requestDetail.title
        self.dateLabel.text = "Created Date: \(requestDetail.createdDate)"
    }
    
    func configureImage(forData data: Data?) {
        guard let data = data, let image = UIImage.init(data: data) else {
            self.imgView.image = UIImage.init(named: "defaultPlaceholder")
            return
        }
        self.imgView.image = image
    }
}
