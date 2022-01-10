//
//  ViewController.swift
//  Calculator
//
//  Created by Kostadin Samardzhiev on 8.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    private var calculatorLogic = CalculatorLogic()
    
    private var didFinishTyping = true
    private var resultValue: Double {
        get {
            guard let number = Double(resultLabel.text!) else {
                fatalError("Unable to cast label to number")
            }
            return number
        }
        
        set {
            resultLabel.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func operationPressed(_ sender: UIButton) {
        didFinishTyping = true
        calculatorLogic.setNumber(resultValue)

        if let calcMethod = sender.currentTitle {
            if let result = calculatorLogic.calculate(symbol: calcMethod) {
                resultValue = result
            }
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
    
        if let number = sender.currentTitle {
            if didFinishTyping {
                resultLabel.text = number
                didFinishTyping = false
            } else {
                if number == "." {
                    let isInt = floor(resultValue) == resultValue
                    if !isInt {
                        return
                    }
                }
                resultLabel.text! += number
            }
        }
    }
}

