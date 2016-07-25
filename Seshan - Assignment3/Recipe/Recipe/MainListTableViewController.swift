//
//  ViewController.swift
//  Recipe
//
//  Created by Rahul Seshan on 7/24/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import UIKit

class MainListTableViewController: UITableViewController {

    // MARK: Declaration
    
    private var recipes = [Recipe]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let items = [
            Recipe(name: "Apple Pie", cookingTime: 10, description: "Pie made of apple", listOfIngredients: ["Apple", "Baking Stuff"], steps: ["Add apple", "mix baking stuff", "oven for 15 minutes"]),
            Recipe(name: "Pizza", cookingTime: 30, description: "Nomnomnom", listOfIngredients: ["Cheeze", "Sauce"], steps: ["Make Pizza", "Eat Pizza"]),
            Recipe(name: "Sushi", cookingTime: 0, description: "Greatest food on earth", listOfIngredients: ["Raw fish", "Rice"], steps: ["Roll", "Add soy sauce", "Scarf down"])
            
        ]
        recipes.appendContentsOf(items)
    }
    
    // MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailViewController = segue.destinationViewController as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let recipe = recipes[indexPath.row]
                detailViewController.recipe = recipe
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("maincellidentifier", forIndexPath: indexPath)
        
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        cell.detailTextLabel?.text = recipe.description
        
        return cell
    }

}

