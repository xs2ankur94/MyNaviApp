//
//  ViewController.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 03/10/22.
//

//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

import UIKit

struct RequestData: Codable {
    var requests: [RequestDetail]?
}

struct User: Codable {
    var name: String
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageUrl = "avatar_url"
    }
}

struct RequestDetail : Codable {
    var uniqueId: Double
    var title: String
    var createdDate: Date?
    var closedDate: Date?
    var user: User
    
    enum CodingKeys: String, CodingKey {
        case uniqueId = "id"
        case title = "title"
        case createdDate = "created_at"
        case closedDate = "closed_at"
        case user = "user"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            uniqueId = try values.decode(Double.self, forKey: .uniqueId)
            title = try values.decode(String.self, forKey: .title)
            createdDate = try values.decode(Date.self, forKey: .createdDate)
            closedDate = try values.decode(Date.self, forKey: .closedDate)
            user = try values.decode(User.self, forKey: .user)
        } catch  {
//            debugPrint("Error While Decoding \(error)")
            debugPrint("Error: ")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        do {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uniqueId, forKey: .uniqueId)
        try container.encode(title, forKey: .title)
        try container.encode(createdDate, forKey: .createdDate)
        try container.encode(closedDate, forKey: .closedDate)
        try container.encode(user, forKey: .user)
        } catch  {
//            debugPrint("Error While Decoding \(error)")
            debugPrint("Error: ")
        }
    }
}

struct UserViewModel {

    
}

class Observable<T> {
    
    var value: T? {
        didSet {
            listner?(value)
        }
    }
    
    private var listner: ((T?) ->())?
    
    func bind(_ listner: @escaping ((T?) -> ())) {
        listner(value)
        self.listner = listner
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
