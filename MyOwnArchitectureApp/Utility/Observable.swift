//
//  Observable.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation

public final class Observable<T> {
    
    typealias Listener = (T?) -> Void

    var value: T? {
        didSet {
            listner?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private var listner: ((T?) ->())?
    
    func bind(_ listner: Listener?) {
        listner?(value)
        self.listner = listner
    }

}
