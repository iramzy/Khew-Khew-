//
//  JsonURLEncoding.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/21/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

class JsonURLEncoding: EndpointEncoding {
    func encode(_ params: [String : Any], into request: URLRequest) -> URLRequest {
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        var encodedRequest = request
        encodedRequest.httpBody = jsonData
        return encodedRequest
    }
}
