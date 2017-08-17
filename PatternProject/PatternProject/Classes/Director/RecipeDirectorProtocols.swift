//
//  RecipeDirectorProtocols.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

typealias DirectorSuccess = ([Recipe]) -> Void
typealias NetworkResponse = [String: AnyObject]
typealias NetworkSuccess = (NetworkResponse) -> Void
typealias NetworkFailure = (_ error: NSError) -> Void

protocol RecipeDirectorFacade {
    func getRecipesWithSuccess(_ success: @escaping DirectorSuccess, failure: NetworkFailure)
}

protocol RecipeNetworkManager {
    func getRecipesWithSuccess(_ success: @escaping NetworkSuccess, failure: NetworkFailure)
}

protocol RecipeBuilder {
    func buildRecipesFromResponse(_ response: NetworkResponse) -> [Recipe]
}
