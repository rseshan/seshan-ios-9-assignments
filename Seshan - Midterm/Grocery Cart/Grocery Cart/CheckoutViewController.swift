//
//  CheckoutViewController.swift
//  Grocery Cart
//
//  Created by Rahul Seshan on 8/3/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import UIKit

protocol CheckoutViewControllerDelegate: class {
    func removeItems()
}

class CheckoutViewController: UIViewController {

    // MARK: Declaration
    
    weak var delegate: CheckoutViewControllerDelegate?
    
    var numItems: Int?
    var totalValue: Float?
    var change: Float = 0.0
    
    @IBOutlet weak var numItemsLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var validityLabel: UILabel!
    
    @IBOutlet weak var cashGivenLabel: UITextField!
    
    private func floatValueFrom(textField: UITextField) -> Float? {
        if let text = textField.text {
            return Float(text)
        }
        return nil
    }
    
    // MARK: Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let numItems = numItems {
            numItemsLabel.text = String(numItems)
        }
        if let totalValue = totalValue {
            totalAmountLabel.text = String(format: "%.2f", totalValue)
        }
    }
    
    @IBAction func payTheManAction(sender: AnyObject) {
        if let paidAmount = floatValueFrom(cashGivenLabel) {
            if paidAmount < totalValue {
                validityLabel.text = "Not enough cash doomaz"
            } else {
                change = paidAmount - totalValue!
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if
                    let changeViewController = storyboard.instantiateViewControllerWithIdentifier("ChangeViewController") as? ChangeViewController
                {
                    delegate?.removeItems()
                    changeViewController.change = change
                    navigationController?.pushViewController(changeViewController, animated: true)
                }
            }
        } else {
            validityLabel.text = "Invalid Input"
        }
    }
    
    
}
