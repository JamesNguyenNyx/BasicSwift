//: Playground - noun: a place where people can play

import UIKit

//MARK: Model
struct Address {
    
    var street: String
    var city: String
    var state: String
    var zipCode: String
}

//MARK: Controller
class AddressViewController: UIViewController {
    
    var address: Address!
    
    var addressView: AddressView {
        return view as! AddressView
    }
}

//MARK: View
class AddressView: UIView {
    
    @IBOutlet var streetTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
}




