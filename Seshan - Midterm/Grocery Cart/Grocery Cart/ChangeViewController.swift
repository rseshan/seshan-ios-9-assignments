//
//  ChangeViewController.swift
//  Grocery Cart
//
//  Created by Rahul Seshan on 8/3/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import UIKit

class ChangeViewController: UIViewController {
    
    var change: Float?

    @IBOutlet weak var changeLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let change = change {
            changeLabel.text = String(format: "%.2f", change)
        }
    }
    
    @IBAction func finitoAction(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
}
