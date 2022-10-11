//
//  RequestDetailViewModel.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//


import Foundation

struct RequestDetailViewModel {
    
    var requestDetail : Observable<RequestDetail>
    var data : Observable<Data?>
    
    init(requestDetail: RequestDetail, data: Data?) {
        self.requestDetail = Observable(requestDetail)
        self.data = Observable(data)
    }
    
}
