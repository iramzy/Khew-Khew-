//
//  JokesPeresenter.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import Foundation

class JokesPeresenter: JokesViewModel {
    
    
    
    private let jokesGetter: JokesUsecase
    
    var jokeSetup: Dynamic<String> = Dynamic("")
    var jokePunchline: Dynamic<String> = Dynamic("")
    var showActivityIndicator: Dynamic<Bool> = Dynamic(false)
    
    init(jokesGetter: JokesUsecase){
        self.jokesGetter = jokesGetter
    }
    
    func getJoke() {
        showActivityIndicator.value = true
        jokesGetter.getJokes {[weak self] (joke) in
            self?.showActivityIndicator.value = false
            if let setup = joke?.setup , let punchline = joke?.punchline{
                self?.jokeSetup.value = setup
                self?.jokePunchline.value = punchline
            }
        }
    }
}

