//
//  RequestChildCoordinator.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 11/10/22.
//

import Foundation
import UIKit

class RequestChildCoordinator : ChildCoordinator {
   
    weak var parentCoordinator: ParentCoordinator?
    var navController: UINavigationController
    let diContainer: NaviDIContainer = NaviDIContainer()

    init(with navigationController: UINavigationController){
        self.navController = navigationController
    }

    func configureChildViewController() {
        let naviViewController = diContainer.createNaviViewController(coordinator: self)
        naviViewController.requestCoordinator = self
        self.navController.pushViewController(naviViewController, animated: true)
    }

    func navigateToDetailRequestVC(requestDetail: RequestDetail, imageData: Data?) {
        let requestViewController = diContainer.createRequestDetailViewController(requestDetail: requestDetail, imageData: imageData)
        self.navController.pushViewController(requestViewController, animated: true)
    }
    
    deinit {
        print("INSIDE DEINIT ******************")
    }
}
