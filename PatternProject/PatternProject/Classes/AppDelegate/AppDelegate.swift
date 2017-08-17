//
//  AppDelegate.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.configureInitialViewController()
        return true
    }
    
    fileprivate func configureInitialViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            let recipeVC = RecipeListViewController(nibName: RecipeListViewController.className, bundle: nil)
            let navigation = UINavigationController(rootViewController: recipeVC)
            window.rootViewController = navigation
            window.makeKeyAndVisible()
        }
    }
}

