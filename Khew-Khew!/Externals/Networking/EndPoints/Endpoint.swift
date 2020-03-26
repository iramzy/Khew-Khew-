//
//  Endpoint.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/21/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation


protocol Endpoint {
    associatedtype ResponseModel: Codable
    func asURLRequest() throws -> URLRequest
    func validateResponse(response: NetworkClientResponse) -> NetworkError?
}

extension Endpoint {
    
    func excute(client: NetworkClient = AlamofireClient(), completion: @escaping (ResponseModel?, NetworkError?) -> Void) {
        
        do {
            client.executeRequest(try asURLRequest()) { (response, error) in
                guard let response = response else {
                    completion(nil,GenericNetworkError(debugError: error))
                    return
                }
                
                if let error = self.validateResponse(response: response) {
                    completion(nil, error)
                    return
                }
                
                do {
                    completion(try JSONDecoder().decode(ResponseModel.self, from: response.data),nil)
                } catch let error {
                    completion(nil,GenericNetworkError(debugError: error))
                    return
                }
            }
        } catch let error {
            completion(nil, GenericNetworkError(debugError: error))
        }
        
    }
}






