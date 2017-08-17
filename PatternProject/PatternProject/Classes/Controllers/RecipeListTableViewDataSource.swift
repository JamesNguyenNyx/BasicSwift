//
//  RecipeListTableViewDataSource.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

class RecipeListTableViewDataSource: NSObject {
    
    var recipeArray: [Recipe]? = nil
    
    func recipeForIndexPath(_ indexPath: IndexPath) -> Recipe? {
        return recipeArray?[indexPath.row]
    }
}


//MARK: RecipeListTableViewDataSource
extension RecipeListTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = recipeArray?[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.className, for: indexPath) as? RecipeCell {
            
            cell.recipeTitleLabel.text = item?.title
            
            if let prepTimeInMinutes = item?.prepTimeInMinutes {
                if prepTimeInMinutes == 1 {
                    cell.recipePrepTimeLabel.text = "Prep time: \(prepTimeInMinutes) minute"
                } else {
                    cell.recipePrepTimeLabel.text = "Prep time: \(prepTimeInMinutes) minutes"
                }
            } else {
                cell.recipePrepTimeLabel.text = ""
            }
            
            if let imageName = item?.imageName {
                let imageURL = Bundle.main.url(forResource: imageName, withExtension: ".jpg")!
                cell.recipeImageView.af_setImage(withURL: imageURL)
                
            } else {
                cell.recipeImageView.image = nil
            }
            
            return cell

        }
        
        return UITableViewCell()
    
    }
}
