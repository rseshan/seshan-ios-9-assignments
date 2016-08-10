//
//  MainRegisterTableTableViewController.swift
//  Grocery Cart
//
//  Created by Rahul Seshan on 8/1/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import UIKit

class MainRegisterTableViewController: UITableViewController {

    // MARK: Declaration
    
    private var items = [Item]()
    
    // MARK: Segue
    
    @IBAction func addItem(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "AddItemStoryboard", bundle: nil)
        
        if
            let addNavigationController = storyboard.instantiateViewControllerWithIdentifier("AddNavigationController") as? UINavigationController,
            let addItemViewController = addNavigationController.topViewController as? AddItemViewController
        {
            addItemViewController.delegate = self
            presentViewController(addNavigationController, animated: true) {}
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "checkoutsegueidentifier" {
            if let checkoutViewController = segue.destinationViewController as? CheckoutViewController {
                checkoutViewController.numItems = items.count
                var total: Float = 0.00
                for index in 0...(items.count - 1) {
                    total += items[index].price
                }
                checkoutViewController.delegate = self
                checkoutViewController.totalValue = total
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("maincellidentifier", forIndexPath: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$" + String(format: "%.2f", item.price)
        
        return cell
    }
}

extension MainRegisterTableViewController: AddItemViewControllerDelegate {
    
    func userDidAddItem(item: Item) {
        items.append(item)
        tableView.reloadData()
    }
}

extension MainRegisterTableViewController: CheckoutViewControllerDelegate {
    
    func removeItems() {
        items.removeAll()
        tableView.reloadData()
    }
}