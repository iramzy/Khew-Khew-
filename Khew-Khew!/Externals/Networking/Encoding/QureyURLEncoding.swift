//
//  QureyURLEncoding.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/21/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

class QureyURLEncoding: EndpointEncoding {
    func encode(_ params: [String : Any], into request: URLRequest) -> URLRequest {
        var components = URLComponents(string: request.url!.absoluteString)
        components?.queryItems = params.map({URLQueryItem(name: $0.key, value: $0.value as? String ?? "")})
        var encodedRequest = request
        encodedRequest.url = components?.url
        return encodedRequest
    }
}
