//
//  JokesUsecaseMock.swift
//  Khew-Khew!Tests
//
//  Created by Mohamed Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

@testable import Khew_Khew_

class JokesUsecaseMock: JokesUsecase {
    
    var joke: Joke = Joke(setup: "setup", punchline: "punchline")
    
    var shouldContinueWithFinishCompletion: Bool = true
    
    func getJokes(completion: @escaping (Joke?) -> Void) {
        if shouldContinueWithFinishCompletion {
            completion(joke)
        }
    }
}
