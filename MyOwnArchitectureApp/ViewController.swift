//
//  ViewController.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 03/10/22.
//

import UIKit

struct Data: Codable {
    var users: [User]
}

struct User: Codable {
    var name: String
    var tile: String
    var image: String?
    var created: Date?
    var closedDate: Date?
    
    enum CodingKeys: String {
        case name = "UserName"
        case title
        case image = "userImage"
        case created = "Created date"
        case closedDate = "Closed date"
    }
}

struct UserViewModel {

    
}

struct Observable<T> {
    private var value: T? {
        didSet {
            listner?(value)
        }
    }
    
    var listner: ((T?) ->())?
    
    mutating func bind(_ listner: @escaping ((T?) -> ())) {
        self.listner = listner
        listner(value)
    }

}

class ViewController: UIViewController {

    
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
}
