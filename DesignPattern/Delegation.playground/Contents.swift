//: Playground - noun: a place where people can play

import UIKit


protocol MenuViewControllerDelegate: NSObjectProtocol {
    
    func menuViewController(viewController: MenuViewController, didSelectMenuItem: MenuItem)
}

class MenuViewController: UIViewController {
    var delegate: MenuViewControllerDelegate?
    
    func menuItemSelected(menuItem: MenuItem) {
        delegate?.menuViewController(viewController: self, didSelectMenuItem: menuItem)
    }
}


class MenuItem {
    
    let name: String
    let index: Int
    
    init(name: String, index: Int) {
        self.name = name
        self.index = index
    }
}
