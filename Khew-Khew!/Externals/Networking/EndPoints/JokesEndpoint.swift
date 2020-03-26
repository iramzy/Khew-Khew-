//
//  JokesEndpoint.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/21/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

public typealias Header = (key: String, value: Any)

protocol JokesEndpoint: Endpoint{
    var path: String {get}
    var method: JokesEndpointMethods {get}
    var encoding: EndpointEncoding {get}
    var parameters: [String: Any] {get}
    var headers: [String: String] {get}
    var authorization: JokesEndpointAuthorization {get}
}

enum JokesEndpointMethods: String {
    case get
    case post
}

enum JokesEndpointAuthorization {
    case none
}


extension JokesEndpoint {
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: path) else {
            throw UrlRequestInvalidUrlError() 
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { (Header) in
            request.addValue(Header.key,forHTTPHeaderField: Header.value)
        }
        request = encoding.encode(parameters, into: request)
        
        return request
    }
    
    func validateResponse(response: NetworkClientResponse) -> NetworkError? {
        JokesErrorHandling().validate(response: response)
    }
}



