//
//  AlamofireClient.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/22/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireClient: NetworkClient {
    func executeRequest(_ request: URLRequest, completion: @escaping (NetworkClientResponse?, Error?) -> Void) {
        Alamofire.request(request).responseData { (dataResponse) in
            guard dataResponse.result.isSuccess, let data = dataResponse.result.value, let response = dataResponse.response else {
                completion(nil,dataResponse.result.error)
                return
            }
            completion(NetworkClientResponse(data: data, statusCode: response.statusCode, headers: response.allHeaderFields as? [String:String] ?? [:]),nil)
        }
    }
}
