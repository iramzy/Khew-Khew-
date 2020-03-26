//
//  JokesUsecase.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

protocol JokesUsecase{
    func getJokes(completion: @escaping(_ joke: Joke?)->Void)
}

class JokesUsecaseImplementation: JokesUsecase {
    private var jokesRepo: JokesRepo
    init(jokesRepo: JokesRepo) {
        self.jokesRepo = jokesRepo
    }
    
    func getJokes(completion: @escaping(_ joke: Joke?)->Void) {
        jokesRepo.getJokes { (joke) in
            guard let joke = joke else {return}
            completion(joke)
        }
    }
    
}
