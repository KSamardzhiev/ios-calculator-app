//
//  ViewController.swift
//  Calculator
//
//  Created by Kostadin Samardzhiev on 8.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var didFinishTyping = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func operationPressed(_ sender: UIButton) {
        didFinishTyping = true
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
    
        if let number = sender.currentTitle {
            if didFinishTyping {
                resultLabel.text = number
                didFinishTyping = false
            } else {
                resultLabel.text! += number
            }
            
        }
    }
}

