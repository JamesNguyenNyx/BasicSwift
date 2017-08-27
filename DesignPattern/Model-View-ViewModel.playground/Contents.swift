//: Playground - noun: a place where people can play

import UIKit


//MARK: Model
struct Person {
    
    let firstName: String
    let lastName: String
    let birthDay: Date
}

//MARK: ViewModel
class PersonViewModel {
    
    let person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var fullName: String {
        return person.firstName + " " + person.lastName
    }
    
    var birthday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: person.birthDay as Date)
    }
}

//MARK: View
class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var birthdayLabel: UILabel?
    
    func setViewModel(viewModel: PersonViewModel) {
        self.nameLabel?.text = viewModel.fullName
        self.birthdayLabel?.text = viewModel.birthday
    }
}

//MARK: TEST
let jamesTest = Person(firstName: "James", lastName: "Nguyen", birthDay: Date())
let viewModel = PersonViewModel(person: jamesTest)

let tableViewCell = PersonTableViewCell()
tableViewCell.setViewModel(viewModel: viewModel)

