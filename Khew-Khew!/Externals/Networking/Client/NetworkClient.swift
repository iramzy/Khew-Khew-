//
//  NetworkClient.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/22/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func executeRequest(_ request: URLRequest, completion: @escaping (NetworkClientResponse?, Error?) -> Void) 
}


struct NetworkClientResponse {
    let data: Data
    let statusCode: Int
    let headers: [String:String]
}
