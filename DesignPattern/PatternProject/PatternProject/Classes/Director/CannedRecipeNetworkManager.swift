//
//  CannedRecipeNetworkManager.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

class CannedRecipeNetworkManager: RecipeNetworkManager {
    
    fileprivate let waitTime: UInt64 = 2
    
    func getRecipesWithSuccess(_ success: @escaping NetworkSuccess, failure: NetworkFailure) {
        let dispatchTime = DispatchTime.now() + Double(Int64(waitTime * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            success(self.recipesJSON())
        }
    }
    
    func recipesJSON() -> [String: AnyObject] {
        let path = Bundle.main.path(forResource: "CannedNetworkResponse", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
        return json as! [String: AnyObject]
    }
}
