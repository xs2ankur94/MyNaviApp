//
//  APPDIContainer.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation

class NaviDIContainer {
    
    let apiServiec: APIServiceProtocol = APIService()
    
    // MARK: NaviViewController
    func createNaviViewController(coordinator: RequestChildCoordinator) -> NaviViewController {
        return NaviViewController.create(wihViewModel: getRequestViewModel(), coordinator: coordinator)
    }
    
    func getRequestDataRepo() -> RequestDataRepositoryProtocol {
        return RequestDataRepository(apiService: apiServiec)
    }
    
    func getRequestViewModel() -> RequestViewModel {
       return RequestViewModel.init(requestRepository: getRequestDataRepo())
    }
    
    
    // MARK: RequestDetailViewController
    func createRequestDetailViewController(requestDetail: RequestDetail, imageData: Data?) -> RequestDetailViewController {
        return  RequestDetailViewController.create(detailViewModel: getRequestDetailViewModel(requestDetail: requestDetail, imageData: imageData))
    }
    
    func getRequestDetailViewModel(requestDetail: RequestDetail, imageData: Data?) -> RequestDetailViewModel {
        return RequestDetailViewModel.init(requestDetail: requestDetail, data: imageData)
    }
    
    deinit {
        print("*************** DEINIT DI")
    }
}
