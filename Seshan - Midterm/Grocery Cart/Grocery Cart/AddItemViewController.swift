//
//  AddItemViewController.swift
//  Grocery Cart
//
//  Created by Rahul Seshan on 8/1/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func userDidAddItem(item: Item)
}

class AddItemViewController: UIViewController {
    
    weak var delegate: AddItemViewControllerDelegate?
    
    // MARK: Actions

    @IBAction func cancelButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addItemUnoAction(sender: AnyObject) {
        let item = Item(name: "Chocolate", price: 5.00)
        delegate?.userDidAddItem(item)
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func addItemDuoAction(sender: AnyObject) {
        let item = Item(name: "Banana", price: 7.50)
        delegate?.userDidAddItem(item)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addItemTresAction(sender: AnyObject) {
        let item = Item(name: "Spinach", price: 2.75)
        delegate?.userDidAddItem(item)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addItemQuatroAction(sender: AnyObject) {
        let item = Item(name: "Salmon", price: 20.25)
        delegate?.userDidAddItem(item)
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addItemCincoAction(sender: AnyObject) {
        let item = Item(name: "Orange", price: 6.80)
        delegate?.userDidAddItem(item)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}