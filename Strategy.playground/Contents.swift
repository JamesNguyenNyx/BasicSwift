//: Playground - noun: a place where people can play

import UIKit

protocol TravelProtocol {
    func travel()
}

class Bird {
    var name: String
    var travelMethod: TravelProtocol
    
    init(name: String, travelMethod: TravelProtocol) {
        self.name = name
        self.travelMethod = travelMethod
    }
    
    func travel() {
        travelMethod.travel()
    }
}

class FlyTravel: TravelProtocol {
    func travel() {
        print("Look, I can fly")
    }
}

class SlideTravel: TravelProtocol {
    func travel() {
        print("Slide ~ Wee!")
    }
}

//Test
let duck = Bird(name: "Duck", travelMethod: FlyTravel())
duck.travel()

let penguin = Bird(name: "Penguin", travelMethod: SlideTravel())
penguin.travel()
