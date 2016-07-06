//
//  ViewController.swift
//  Assignment2
//
//  Created by Rahul Seshan on 7/5/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import UIKit

class threeAppViewController: UIViewController {
    
    // MARK: Declaration
    
    @IBOutlet weak var yearBirthTextField: UITextField!
    @IBOutlet weak var ageStatusLabel: UILabel!
    
    @IBOutlet weak var billCostTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var numPeopleTextField: UITextField!
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Private
    
    private func intValueFrom(textField: UITextField) -> Int? {
        if let text = textField.text {
            return Int(text)
        }
        return nil
    }
    
    private func floatValueFrom(textField: UITextField) -> Float? {
        if let text = textField.text {
            return Float(text)
        }
        return nil
    }
    
    private func uint32ValueFrom(textField: UITextField) -> UInt32? {
        if let text = textField.text {
            return UInt32(text)
        }
        return nil
    }
    
    // MARK: Actions
    
    @IBAction func verifyAge(sender: UIButton) {
        if
            let birthYear = intValueFrom(yearBirthTextField) {
            if  birthYear <= 1995 {
                ageStatusLabel.text = "You can drink, vote and drive."
            } else if birthYear <= 1998 {
                ageStatusLabel.text = "You can vote and drink."
            } else if birthYear <= 2000 {
                ageStatusLabel.text = "You can drive."
            } else {
                ageStatusLabel.text = "You are a baby."
            }
        } else {
            ageStatusLabel.text = "Invalid Input."
        }
    }
    
    @IBAction func splitBill(sender: UIBarButtonItem) {
        if
            let billCost = floatValueFrom(billCostTextField),
            let tip = floatValueFrom(tipTextField),
            let numPeople = floatValueFrom(numPeopleTextField)
        {
            let splitAmount = billCost*(1+(tip/100))/numPeople
            splitAmountLabel.text = "$\(splitAmount)"
        } else {
            splitAmountLabel.text = "Invalid Input"
        }
    }

    @IBAction func guessNumber(sender: UIButton) {
        if let guess = uint32ValueFrom(guessTextField) {
            let computerGuess = arc4random_uniform(10) + 1
            if (guess >= 1) && (guess <= 10) {
                if guess == computerGuess {
                    resultLabel.text = "Correct Guess!"
                } else {
                    resultLabel.text = "Incorrect Guess!"
                }
            } else {
                resultLabel.text = "Invalid Number!"
            }
        } else {
            resultLabel.text = "Invalid Input"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

