//
//  Dynamic.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
