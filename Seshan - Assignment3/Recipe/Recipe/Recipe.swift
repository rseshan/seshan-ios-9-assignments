//
//  Recipe.swift
//  Recipe
//
//  Created by Rahul Seshan on 7/24/16.
//  Copyright © 2016 Rahul Seshan. All rights reserved.
//

import Foundation

class Recipe {
    
    let name: String
    let cookingTime: Int
    let description: String
    let listOfIngredients: [String]
    let steps: [String]
    
    init(name: String, cookingTime: Int, description: String, listOfIngredients: [String], steps: [String]) {
        self.name = name
        self.cookingTime = cookingTime
        self.description = description
        self.listOfIngredients = listOfIngredients
        self.steps = steps
    }
}
