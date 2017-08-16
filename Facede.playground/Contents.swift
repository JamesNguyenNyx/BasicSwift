//: Playground - noun: a place where people can play

import UIKit


class Model {
    //Declare model here
}

class NetworkManager {
    
    func getModelsWithCompletionHandler(completionHandler: (NSData) -> Void) {
        //Call async networking methods
        //Then inside completion block, call completionHandler
        
        let responseData = NSData() //response data from server
        completionHandler(responseData)
    }
}

class Builder {
    
    func modelsFromData(data: NSData) -> [Model] {
        //logic to convert the data into model objets
        return [Model]()
    }
}

protocol DirectorFacade {
    
    func getModelsWithCompletionHandler(completionHandler: ([Model]) -> Void)
}


class Director: DirectorFacade {
    
    let builder: Builder
    let networkManager: NetworkManager
    
    init(builder: Builder, networkManager: NetworkManager) {
        self.builder = builder
        self.networkManager = networkManager
    }
    
    func getModelsWithCompletionHandler(completionHandler: ([Model]) -> Void) {
        self.networkManager.getModelsWithCompletionHandler { (data) in
            let models = self.builder.modelsFromData(data: data)
            completionHandler(models)
        }
    }
}


class ViewController: UIViewController {
    var director: DirectorFacade!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        director.getModelsWithCompletionHandler { (models) in
            //Do somethings here
        }
    }
}
