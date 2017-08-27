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
        configureTableView()
    }
    
    fileprivate func configureTableView() {
        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView?.register(RecipeCell.nib, forCellReuseIdentifier: RecipeCell.identifier)
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
        let detailVC = DetailRecipeViewController(nibName: DetailRecipeViewController.className, bundle: nil)
        detailVC.recipe = tableViewDataSource.recipeArray?[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
