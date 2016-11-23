

//Application 1
struct Application1: DisplayNameDelegate {
    func displayName(name: String) -> String {
        print("App1 \(name)")
        return "Appo "+name+" Eppo 2.0"
    }
}

//Application 2
struct Application2: DisplayNameDelegate {
    func displayName(name: String) -> String{
        print("App2 \(name)")
        return "Say hello to " + name
    }
}


//Common Function
protocol DisplayNameDelegate {
    func displayName(name: String)-> String
}


struct Person {
    var displayNameDelegate: DisplayNameDelegate
    var familyName: String?
    
    init(displayNameDelegate: DisplayNameDelegate) {
        self.displayNameDelegate = displayNameDelegate
    }
    
    var firstName = "" {
        didSet {
            displayNameDelegate.displayName(name: getFullName())
        }
    }
    var lastName = "" {
        didSet {
            displayNameDelegate.displayName(name: getFullName())
        }
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName) \(familyName ?? "")"
    }
    
    var greet:String {
        return  displayNameDelegate.displayName(name: getFullName())
    }
}


//------------
//Application1 Implementaion
var app1Delegate = Application1()
var person = Person(displayNameDelegate: app1Delegate)
person.firstName = "Kabali"
person.lastName = "Swaran"
person.familyName = "Rajni"
person.greet


//Application 2 Implementation
var app2Delegate = Application2()
//UI Class
var person2 = Person(displayNameDelegate: app2Delegate)
person2.firstName = "Robo"
person2.lastName = "Raj"
person2.greet
//-------------------


