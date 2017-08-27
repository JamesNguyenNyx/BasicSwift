//
//  RecipeDirector.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

final class RecipeDirector: RecipeDirectorFacade {
    
    fileprivate let builder: RecipeBuilder
    fileprivate let networkManager: RecipeNetworkManager
    
    init(builder: RecipeBuilder, networkManager: RecipeNetworkManager) {
        self.builder = builder
        self.networkManager = networkManager
    }
    
    func getRecipesWithSuccess(_ success: @escaping DirectorSuccess,
                               failure: NetworkFailure) {
        
        self.networkManager.getRecipesWithSuccess({
            [unowned self] response in
            let recipes = self.builder.buildRecipesFromResponse(response)
            success(recipes)
            }, failure: failure)
    }

}

// MARK: - Class Constructors

extension RecipeDirector {
    
    class func cannedRecipeDirector() -> RecipeDirector {
        let builder = CannedRecipeBuilder()
        let networkManager = CannedRecipeNetworkManager()
        return RecipeDirector(builder: builder,
                              networkManager: networkManager)
    }
}
