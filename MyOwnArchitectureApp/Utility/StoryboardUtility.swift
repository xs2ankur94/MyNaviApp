//
//  InitiUtility.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation
import UIKit

protocol StoryboardInitProtocol: UIViewController {
    static func instantiateFromStoryBoard(storyboardName name: String?) -> Self
}

extension StoryboardInitProtocol {
    static func instantiateFromStoryBoard(storyboardName name: String? = "Main") -> Self {
        let storyboard = UIStoryboard.init(name: name!, bundle: nil)
        let vcIdentifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: vcIdentifier) as! Self
    }    
}

