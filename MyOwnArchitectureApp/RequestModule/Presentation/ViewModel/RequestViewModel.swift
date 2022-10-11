//
//  RequestViewModel.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation

protocol RequestViewModelProtocol {
    var labelText : Observable<String> { get set }
    var requestData : Observable<[RequestDetail]> { get set }
    func getAllClosedRequest()
    func downloadImage(indexPath: IndexPath, onCompletion: @escaping (Data)-> Void)
    func getImageData(indexPath: IndexPath) -> Data?
    init(requestRepository: RequestDataRepositoryProtocol)
}


class RequestViewModel : RequestViewModelProtocol {
   
    

    var labelText = Observable("My Navi App")
    var requestData = Observable([RequestDetail]())
    private var requestRepository : RequestDataRepositoryProtocol!
    // Should USE Unique ID: But Assuiming RequestDetail Model: Unique ID is double os it will be unique
    var downloadedImages: [Double: Data] = [:]

    required init(requestRepository: RequestDataRepositoryProtocol) {
        self.requestRepository = requestRepository
        self.getAllClosedRequest()
    }
    
    func downloadImage(indexPath: IndexPath, onCompletion: @escaping (Data)-> Void) {
        if let requestDetail = self.requestData.value?[indexPath.row] {
            if let data = self.downloadedImages[requestDetail.uniqueId] {
                onCompletion(data)
            } else {
                if let url = requestDetail.user.imageUrl {
                    requestRepository.downloadImage(urlPath: url) { [weak self] data in
                        self?.downloadedImages[requestDetail.uniqueId] = data
                        onCompletion(data)
                    }
                }
            }
        }
    }

    
            
    func getImageData(indexPath: IndexPath) -> Data? {
        if let requestDetail = self.requestData.value?[indexPath.row] {
            if let data = self.downloadedImages[requestDetail.uniqueId] {
                return data
            }
        }
        
        return nil
    }
            
    func getAllClosedRequest() {
        requestRepository.getAllClosedRequest { requestDetailArray in
            self.requestData.value = requestDetailArray
        } onError: { error in
            debugPrint("Error In RequestModel:  \(error.localizedDescription)")
        }

    }
        
    
   

    
}
