//
//  RequestDataRepository.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation

protocol RequestDataRepositoryProtocol {
    func getAllClosedRequest( onSuccess: @escaping (([RequestDetail]) -> ()), onError: ((Error) -> ())?)
    func downloadImage(urlPath: String?,  onCompletion: @escaping (Data) -> Void)
}
