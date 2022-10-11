//
//  NetworkUtitlity.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation

struct RequestRepositoryEndPoint {
    static let closedRequestPath = "https://api.github.com/repos/xs2ankur94/MyNaviApp/pulls"
}


struct RequestDataRepository: RequestDataRepositoryProtocol {
    
    private var apiService: APIServiceProtocol!
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func getAllClosedRequest(onSuccess: @escaping (([RequestDetail]) -> ()), onError: ((Error) -> ())?) {
        self.apiService.getDataForURL(urlPath: RequestRepositoryEndPoint.closedRequestPath , queryParams: ["state":"closed"]) { apiData in
            do {
                let requestData = try JSONDecoder().decode([RequestDetail].self, from: apiData)
                debugPrint("RequestData Object In API:  \(requestData)")
                onSuccess(requestData)
            } catch let err {
                debugPrint("Error In Conversion of Api data to Object:  \(err.localizedDescription)")
            }
        } onFailure: { response in
            debugPrint("Response Error In API:  \(String(describing: response?.statusCode))")
        } onError: { error in
            debugPrint("Error In API:  \(error?.localizedDescription)")
//            onError!(error!)
        }
    }
    
    
    func downloadImage(urlPath: String?, onCompletion: @escaping (Data) -> Void) {
        self.apiService.getDataForURL(urlPath: urlPath, queryParams: nil) { apiData in
            do {
                onCompletion(apiData)
            } catch let err {
                debugPrint("Error In Conversion of Api data to Object:  \(err.localizedDescription)")
            }
        } onFailure: { response in
            debugPrint("Response Error In API:  \(String(describing: response?.statusCode))")
        } onError: { error in
            debugPrint("Error In API:  \(error?.localizedDescription)")
//            onError!(error!)
        }
    }
    
    
}
