//
//  ErrorHandling.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/22/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

protocol NetworkErrorHandling {
  func validate(response: NetworkClientResponse) -> NetworkError?
}

protocol NetworkError {
  var message: String {get}
  var code: String {get}
  var debug: Error? {get}
}
