//
//  JokesRepo.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

protocol JokesRepo {
    func getJokes(completion: @escaping (Joke?) -> Void)
}

class JokesRepoImplementation: JokesRepo {
    func getJokes(completion: @escaping (Joke?) -> Void) {
        GetJokesEndpoint().excute { (response, error) in
            guard let response = response else {
                completion(nil)
                return
            }
            completion(Joke(setup: response.setup, punchline: response.punchline))
        }
    }
}
