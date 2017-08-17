//
//  RecipeCell.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit
import AlamofireImage

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipePrepTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
