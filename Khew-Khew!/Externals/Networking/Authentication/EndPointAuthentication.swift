//
//  EndPointAuthentication.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/22/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

protocol EndPointAuthentication {
    func authenticate(request: URLRequest) -> URLRequest
}
