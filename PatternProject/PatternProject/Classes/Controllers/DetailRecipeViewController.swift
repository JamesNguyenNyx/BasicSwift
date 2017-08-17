//
//  DetailRecipeViewController.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var prepTimeLabel: UILabel!
    @IBOutlet fileprivate weak var ingredientsLabel: UILabel!
    @IBOutlet fileprivate weak var instructionsLabel: UILabel!
    
    var recipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewWithRecipe()
    }
    
    fileprivate func configureViewWithRecipe() {
        titleLabel.text = recipe.title ?? ""
        
        if let prepTimeInMinutes = recipe.prepTimeInMinutes {
            if prepTimeInMinutes == 1 {
                prepTimeLabel.text = "Prep time: \(prepTimeInMinutes) minute"
            } else {
                prepTimeLabel.text = "Prep time: \(prepTimeInMinutes) minutes"
            }
        } else {
            prepTimeLabel.text = ""
        }
        
        if let imageName = recipe.imageName {
            let imageURL = Bundle.main.url(forResource: imageName, withExtension: ".jpg")!
            imageView.af_setImage(withURL: imageURL)
            
        } else {
            imageView.image = nil
        }
        
        if let ingredients = recipe.ingredients {
            ingredientsLabel.text = "Ingredients:\n" + ingredients
        } else {
            ingredientsLabel.text = ""
        }
        
        if let instructions = recipe.instructions {
            instructionsLabel.text = "Instructions:\n" + instructions
        } else {
            instructionsLabel.text = ""
        }

    }

}
