//
//  EndpointEncoding.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/21/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

protocol EndpointEncoding {
    func encode(_ params: [String:Any], into request:URLRequest) -> URLRequest
}




