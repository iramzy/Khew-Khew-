//
//  JokesViewModel.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

protocol JokesViewModel {
    var jokeSetup: Dynamic<String> {get}
    var jokePunchline: Dynamic<String> {get}
    var showActivityIndicator: Dynamic<Bool> {get}
    
    func getJoke()
}
