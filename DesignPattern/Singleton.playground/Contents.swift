//: Playground - noun: a place where people can play

import UIKit

//MARK: Initializer Injection
class Configuration {
    //.....
}

class Manager {
    init(configuration: Configuration) {
        //......
    }
}


//MARK: Setter Injection
protocol ViewControllerDelegate {
    //....
}

class ViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
}


//MARK: Or a combination of both
protocol ComplexManagerDelegate {
    //....
}

class ComplexManager {
    
    var delegate: ComplexManagerDelegate?
    
    convenience init(configuration: Configuration) {
        self.init(configuration: configuration, delegate: nil)
    }
    
    init(configuration: Configuration, delegate: ComplexManagerDelegate?) {
        // ...
    }
}