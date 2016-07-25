//
//  DetailViewController.swift
//  Recipe
//
//  Created by Rahul Seshan on 7/25/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: Declaration
    
    var recipe: Recipe?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cookingTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var listOfIngredientsLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let recipe = recipe {
            nameLabel.text = recipe.name
            cookingTimeLabel.text = String(recipe.cookingTime)
            descriptionLabel.text = recipe.description
            listOfIngredientsLabel.text = recipe.listOfIngredients.joinWithSeparator(", ")
            stepsLabel.text = recipe.steps.joinWithSeparator(", ")
        }
    }
    
}
