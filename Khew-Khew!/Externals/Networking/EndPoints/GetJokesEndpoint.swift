//
//  JokesEndpoint.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/21/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

struct GetJokesEndpoint: JokesEndpoint {

    typealias ResponseModel = GetJokesResponse
    
    var path: String = "https://official-joke-api.appspot.com/random_joke"
    
    var method: JokesEndpointMethods = .get
    
    var encoding: EndpointEncoding = QureyURLEncoding()
    
    var parameters: [String : Any] = [:]
    
    var headers: [String : String] = [:]
    
    var authorization: JokesEndpointAuthorization = .none
}


struct GetJokesResponse: Codable {
    var id: Int?
    var type: String?
    var setup: String?
    var punchline: String?
}
