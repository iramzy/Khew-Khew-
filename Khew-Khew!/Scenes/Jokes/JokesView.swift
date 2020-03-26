//
//  ViewController.swift
//  Khew-Khew!
//
//  Created by Mohamed Ahmed on 3/21/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import UIKit
import SKActivityIndicatorView

class JokesView: UIViewController {

    @IBOutlet var jokeSetupLabel: UILabel!
    @IBOutlet var jokePunchlineLabel: UILabel!
    
    var viewModel: JokesViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = JokesPeresenter(jokesGetter: JokesUsecaseImplementation(jokesRepo: JokesRepoImplementation()))
        
        viewModel.showActivityIndicator.bind({ $0 ? SKActivityIndicator.show() : SKActivityIndicator.dismiss()})
        viewModel.jokeSetup.bind({self.jokeSetupLabel.text = $0})
        viewModel.jokePunchline.bind({self.jokePunchlineLabel.text = $0})
        viewModel.getJoke()
    }

    @IBAction func makeMeLaughPressed(_ sender: UIButton) {
        viewModel.getJoke()
    }
    
}

    
