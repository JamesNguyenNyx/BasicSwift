//: Playground - noun: a place where people can play

import UIKit

let tableView = UITableView()

let bacsicIdentifier = "basic cell"
let customIdentifier = "custom cell"

class CustomTableViewCell: UITableViewCell {
    //....
}

tableView.register(UITableViewCell.self, forCellReuseIdentifier: bacsicIdentifier)
tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: customIdentifier)

let basicCell = tableView.dequeueReusableCell(withIdentifier: bacsicIdentifier)
let customCell = tableView.dequeueReusableCell(withIdentifier: customIdentifier)


protocol Currency {
    var symbol: String { get }
    var name: String { get }
}

class Euro: Currency {
    var symbol = "€"
    var name = "Euro"
}

class Dollar: Currency {
    var symbol = "$"
    var name = "Dollar"
}

class Yen: Currency {
    var symbol = "¥"
    var name = "Yen"
}

class CurrencyFactory {
    
    class func currentForCountryName(countryName: String) -> Currency{
        
        switch countryName {
        case "United States":
            return Dollar()
        case "Japan":
            return Yen()
        default:
            return Euro()
        }
    }
    
}


let usaCurrency = CurrencyFactory.currentForCountryName(countryName: "United States")
usaCurrency.name

let japanCurrency = CurrencyFactory.currentForCountryName(countryName: "Japan")
japanCurrency.symbol







