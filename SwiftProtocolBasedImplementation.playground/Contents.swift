
//Common Function
protocol DisplayFullName {
    func displayName(name: String) -> String
}


struct Person {
    var displayFullName: DisplayFullName
    var familyName: String?
    
    init(displayFullName: DisplayFullName) {
        self.displayFullName = displayFullName
    }
    
    var firstName = "" {
        didSet {
            displayFullName.displayName(name: getFullName())
        }
    }
    var lastName = "" {
        didSet {
            displayFullName.displayName(name: getFullName())
        }
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName) \(familyName ?? "")"
    }
    
    var greet:String {
        return  displayFullName.displayName(name: getFullName())
    }
}


//Application 1
struct Application1: DisplayFullName {
    func displayName(name: String) -> String {
        return "Say Ola to" + name
    }
}

//Application 2
struct Application2: DisplayFullName {
    func displayName(name: String) -> String{
        return "Say Hello to" + name
    }
}


//------------
//Application1 Implementaion
var app1Information = Application1()
var person = Person(displayFullName: app1Information)
person.firstName = "Steve"
person.lastName = "Smith"
person.familyName = "Sam"
print(person.greet)


//Application 2 Implementation
var app2Information = Application2()
var person2 = Person(displayFullName: app2Information)
person2.firstName = "Tim"
person2.lastName = "Cook"
print(person2.greet)
//-------------------

