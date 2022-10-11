//
//  MainNaviCoordinator.swift
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation
import UIKit

public final class MainCoordinator: ParentCoordinator {

    var childCoordinators: [Coordinator] = [ChildCoordinator]()
    var navController: UINavigationController
    
    
    init(withNavgitationController navController: UINavigationController) {
        self.navController = navController
    }
    
    func configureRootViewController() {
        let requestChildCoordinator = RequestChildCoordinator.init(with: navController)
        childCoordinators.append(requestChildCoordinator)
        requestChildCoordinator.parentCoordinator = self
        requestChildCoordinator.configureChildViewController()
    }
    
    func removeChildCoordinator(child: ChildCoordinator) {
        for(index, coordinator) in childCoordinators.enumerated() {
            if(coordinator === child) {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}



