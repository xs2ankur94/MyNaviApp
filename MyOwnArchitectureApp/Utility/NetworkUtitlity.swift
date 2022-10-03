//
//  NetworkUtitlity.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 03/10/22.
//

import Foundation


struct NetworkUtility {
    
    func getCall(urlPath: String?) {

        guard let urlPath = urlPath, let url = URL(string: urlPath) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
        
            if error != nil {
                debugPrint("Error In API:  \(error?.localizedDescription)")
            } else {
                
                
            }
        }.resume()
        
    }
    
}
