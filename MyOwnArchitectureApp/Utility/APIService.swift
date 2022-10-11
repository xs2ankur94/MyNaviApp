//
//  APIService.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation

protocol APIServiceProtocol {
    typealias onSuccess = (Data) -> Void
    typealias onFailure = (HTTPURLResponse?) -> Void
    typealias onError = (Error?) -> Void
    func getDataForURL(urlPath: String?, queryParams: [String: Any]?, onSuccess: (onSuccess?), onFailure: onFailure?, onError: onError?)
}

struct APIService: APIServiceProtocol {
    
    enum HttpMethodType : String {
        case GET = "get"
        case POST = "post"
    }
  
    func getDataForURL(urlPath: String?, queryParams:  [String: Any]? = nil, onSuccess: onSuccess?, onFailure: onFailure?, onError: onError?) {
        
        guard let urlPath = urlPath , let url = URL(string: urlPath) else {
            return
        }
        
//        var urlRequest = URLRequest.init(url: url)
//        urlRequest.httpMethod = HttpMethodType.GET.rawValue
        
//        if let body = body {
//            do {
//                let requestBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
//                urlRequest.httpBody = requestBody
//            } catch let error {
//                debugPrint("Error In Body serialization \(error.localizedDescription)")
//            }
//        }
        
        var components = URLComponents(string: urlPath)
        if let queryParams = queryParams {
            var queries = [URLQueryItem]()
            for (key,value) in queryParams {
                let urlQueryItem = URLQueryItem(name: key, value: "\(value)")
                queries.append(urlQueryItem)
            }
            components?.queryItems = queries
        }
        
        
        guard let completeUrl = components?.url else {
            // Can write error handling code here
            debugPrint("Error getting URL" )
            return
        }
        
        URLSession.shared.dataTask(with: completeUrl) { apiData, apiResponse, error in
            if error == nil && apiData != nil && apiData?.count != 0 {
                let httpResponse = apiResponse as! HTTPURLResponse
                if (httpResponse.statusCode == 200 ) {
                        onSuccess?(apiData!)
                } else {
                    debugPrint("On Failure In API:  \(httpResponse.statusCode)")
                    onFailure?(httpResponse)
                }
            } else {
                debugPrint("Error In API:  \(error?.localizedDescription)")
                onError?(error)
            }
        }.resume()
    }
    
}
