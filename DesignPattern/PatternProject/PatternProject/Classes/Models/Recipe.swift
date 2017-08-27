//
//  Recipe.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    
    let title: String?
    let ingredients: String?
    let instructions: String?
    let prepTimeInMinutes: Int?
    let imageName: String?
    
    init(title: String?, ingredients: String?, instructions: String?, prepTimeInMinutes: Int?, imageName: String?) {
        
        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
        self.prepTimeInMinutes = prepTimeInMinutes
        self.imageName = imageName
    }
    
    override var description: String {
        
        let title = self.title ?? ""
        return "{Recipe: \(title)}\n"
    }


}
