//
//  Coordinator.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var navController: UINavigationController {get set}
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] {get set}
    func configureRootViewController()
    func removeChildCoordinator(child: ChildCoordinator)
}


protocol ChildCoordinator: Coordinator {
    func configureChildViewController()
    var parentCoordinator : ParentCoordinator? { get set }
}


