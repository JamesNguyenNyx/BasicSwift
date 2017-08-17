//
//  RecipeListViewController.swift
//  PatternProject
//
//  Created by James Nguyen on 2017/08/17.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit
import MBProgressHUD

class RecipeListViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate let tableViewDataSource = RecipeListTableViewDataSource()
    var recipeDirector: RecipeDirectorFacade!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadRecipes()
    }
    
    fileprivate func configureTableView() {
        tableView.dataSource = tableViewDataSource
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
    }
    
    fileprivate func loadRecipes() {
        showHud("Loading")
        
        recipeDirector.getRecipesWithSuccess({ [weak self] recipes in
            
            self?.hideHUD()
            self?.tableViewDataSource.recipeArray = recipes
            self?.tableView.reloadData()
            
            }, failure: { [weak self] error in
                self?.hideHUD()
                print("Error: \(error)")
        })

    }
    
    func showHud(_ message: String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = message
        hud.isUserInteractionEnabled = false
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension RecipeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let indexPath = tableView.indexPathForSelectedRow,
            let recipe = tableViewDataSource.recipeForIndexPath(indexPath) else {
                return
        }
        
        let detailVC = DetailRecipeViewController(nibName: DetailRecipeViewController.className, bundle: nil)
        detailVC.recipe = recipe
        let navigation = UINavigationController(rootViewController: detailVC)
        self.navigationController?.pushViewController(navigation, animated: true)
        
    }
}
