import UIKit

struct PersonName {
    let givenName: String
    let middleName: String
    var familyName: String
    
    func fullName() -> String {
        return "\(givenName) \(middleName) \(familyName)"
    }
    
    mutating func change(familyName: String) {
        self.familyName = familyName
    }
}

var alissasName = PersonName(givenName: "Alissa", middleName: "May", familyName: "Jones")

let alissasBirthName = PersonName(givenName: "Alissa", middleName: "May", familyName: "Jones")
print(alissasBirthName.fullName())
var alissasCurrentName = alissasBirthName
print(alissasCurrentName.fullName())

alissasCurrentName.change(familyName: "Moon")
print(alissasBirthName.fullName())
print(alissasCurrentName.fullName())

class Person : Saveable {
    var saveNeeded: Bool = true
    
    let birthName: PersonName
    let currentName: PersonName
    var countryOfResidence: String
    
    init(name: PersonName, countryOfResidence: String = "UK") {
        self.birthName = name
        self.currentName = name
        self.countryOfResidence = countryOfResidence
    }
    
    // computer property
    var displayString: String {
        return "\(currentName.fullName()) - Location:\(countryOfResidence)"
    }
    
    // added for the closures part
    var saveHandler: ((Bool) -> Void)?
    
    func saveToRemoteDatabase(handler: @escaping (Bool) -> Void) {
        saveHandler = handler
        //
        saveComplete(success: true)
    }
    
    func saveComplete(success: Bool) {
        saveHandler?(success)
    }
}

var name = PersonName(givenName: "Alissa", middleName: "May", familyName: "Jones")
let alissa = Person(name: name)
print(alissa.currentName.fullName())

//--- enums

enum Title: String {
    case mr = "Mr"
    case mrs = "Mrs"
    case mister = "Mister"
    case miss = "Miss"
    case dr = "Dr"
    case prof = "Prof"
    case other  // inferred as 'other'
    
    var isProfessional: Bool {
        return self == Title.dr || self == Title.prof
    }
}

let title1 = Title.mr
let title2 : Title
title2 = .mr

//--- Closures

// no input, no output
let printAuthorDetails: () -> Void = {
    let name = PersonName(givenName: "Keith", middleName: "David", familyName: "Moon")
    let author = Person(name: name)
    print(author.displayString)
}

printAuthorDetails()

// no input, Person output
let createAuthor: () -> Person = {
    let name = PersonName(givenName: "Keith", middleName: "David", familyName: "Moon")
    let author = Person(name: name)
    return author
}

let author = createAuthor()
print(author.displayString)

// String inputs, no output
let printPersonsDetails: (String, String, String) -> Void = {
    given, middle, family in let name = PersonName(givenName: given, middleName: middle, familyName: family)
    let author = Person(name: name)
    print(author.displayString)
}
printPersonsDetails("Kathleen", "Mary", "Moon")

// String inputs, Person output
let createPerson: (String, String, String) -> Person = {
    given, middle, family in
        let name = PersonName(givenName: given, middleName: middle, familyName: family)
        let person = Person(name: name)
        return person
}
let felix = createPerson("Felix", "Robert", "Moon")
print(felix.displayString)

let fox = createPerson("Fox", "Richard", "Moon")
fox.saveToRemoteDatabase() {
    success in
    print("Save finished: Success \(success)")
}

//--- protocols

protocol Saveable {
    var saveNeeded: Bool { get set }
    func saveToRemoteDatabase(handler: @escaping (Bool) -> Void)
}

