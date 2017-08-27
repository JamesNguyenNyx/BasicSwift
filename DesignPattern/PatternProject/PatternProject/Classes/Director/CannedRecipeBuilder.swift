//
//  CannedRecipeBuilder.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

final class CannedRecipeBuilder: RecipeBuilder {
    
    func buildRecipesFromResponse(_ response: NetworkResponse) -> [Recipe] {
        let recipesDictArray = response["recipes"] as! [[String: AnyObject]]
        
        return recipesDictArray.map { recipeDict in
            
            let title = recipeDict["title"] as? String
            let ingredients = recipeDict["ingredients"] as? String
            let instructions = recipeDict["instructions"] as? String
            let prepTime = (recipeDict["prepTime"] as? NSNumber)?.intValue
            let imageName = recipeDict["imageName"] as? String
            
            return Recipe(title: title,
                          ingredients: ingredients,
                          instructions: instructions,
                          prepTimeInMinutes: prepTime,
                          imageName: imageName)
        }
    }

}
