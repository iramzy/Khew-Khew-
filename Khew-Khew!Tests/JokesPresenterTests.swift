//
//  JokesPresenterTests.swift
//  Khew-Khew!Tests
//
//  Created by Mohamed Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import XCTest
@testable import Khew_Khew_

class JokesPresenterTests: XCTestCase {

    var presenter: JokesPeresenter!
    
    var usecase = JokesUsecaseMock()
    
    override func setUp() {
        presenter = JokesPeresenter(jokesGetter: usecase)
    }

    override func tearDown() {
        presenter = nil
    }
    
    
    func testJokeIsRetrievedProperly(){
        usecase.shouldContinueWithFinishCompletion = true
        
        presenter.getJoke()
        
        XCTAssertEqual(presenter.jokeSetup.value, "setup")
        XCTAssertEqual(presenter.jokePunchline.value, "punchline")
    }

  
    func testJokeIsNotRetrievedProperly(){
        usecase.shouldContinueWithFinishCompletion = false
        
        presenter.getJoke()
        
        XCTAssertEqual(presenter.jokeSetup.value, "")
        XCTAssertEqual(presenter.jokePunchline.value, "")
    }

}
