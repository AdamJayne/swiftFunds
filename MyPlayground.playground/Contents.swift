// Learned using Pluralsight

// -------------------------------------------------------------------
//                          Intro
// -------------------------------------------------------------------


var playerName = "Alice"     //String
var age = 21                 //Int
var temperature = 76.8       //float
var activeMembership = true  //boolean

age = age + 44

var bonusScore: Int      // type annotation

var sandwichType: String?  // optionals

// -------------------------------------------------------------------
//                           loops
// -------------------------------------------------------------------


let bunchOfWords = ["potato", "pancakes", "eggs", "monster", "caffiene", "tea"]
var number = 7

//while
while number > 0 {
    number = number - 1
    print(number)
}

// repeat-while loop
repeat {
    number = number - 1
    print(number)
} while number >= 0

// for in loop
for word in bunchOfWords {
    print(word)
}
for number in 0...10 {
    print(number)
}
// -------------------------------------------------------------------
//                          range operators
// -------------------------------------------------------------------


let zeroThroughTenInclusive = 0...10  //inclusive range that includes the value on the right and left
let zeroThroughTenExceptTen = 0..<10  //excluding the value on the right (ten in this case)

for number in stride(from: 0, to: 100, by: 15) {  //strideTo does not include the final value
    print(number)
}
for number in stride(from: 0, through: 256, by: 16) { //strideThrough does include the final value
    print(number)
}

// -------------------------------------------------------------------
//                      string interpolation
// -------------------------------------------------------------------

let killed = "xXxBallinBoixXx"
let killedBy = "86_year_old"
let killedWith = "Frying Pan"
let byDistance = "3 meters"

let killMessage = "Player \(killed) was shreked by \(killedBy) with weapon \(killedWith) from a distance of \(byDistance)"
print(killMessage)

// -------------------------------------------------------------------
//                         functions
// -------------------------------------------------------------------


func showMessage(number: Int, name: String) {  //Swift function parameters are constants and cannot be mutated.
    print("the function call worked and your number is \(number), \(name)")
}
showMessage(number: 75, name: "Adam")  // when you call a function with parameters, the parameter name must be called with the value

//functions that return values
func returnAnInteger() -> Int {
    let integer = 7
    print(integer)
    return integer
}

let result = returnAnInteger()

let weeksUnemployed = 27
func weeksToMonths(weeks: Int) -> Int{
    let months = weeks / 4
    return months
}

print(weeksToMonths(weeks: weeksUnemployed))

// intentionally ignore a return value ( have an underscore equal the returned value )
_ = returnAnInteger()

// changing argument labels
func calculateDifference(from firstAmount: Int, to secondAmount: Int) -> Int {  // there are two names here
    if firstAmount > secondAmount {                                             // "from" and "first amount"
        return firstAmount - secondAmount                                       // "from" is the name used when calling
    } else {                                                                    // "firstAmount" is used internally
        return secondAmount - firstAmount
    }
}
let result2 = calculateDifference(from: 456, to: 765)               // function is called and labels are "from" and "to"
print("The difference is: \(result2)")                              // this makes things easier to understand

// -------------------------------------------------------------------
//                        Enumerations
// -------------------------------------------------------------------


enum MediaType {
    case book
    case movie
    case music
    case game
}

var itemType: MediaType
itemType = MediaType.book
itemType = .music

//enumerations with raw values
enum BottleSize: String {
    case half = "37.5 cl"
    case standard = "75 cl"
    case magnum = "1.5 litres"
    case jeroboam = "3 litres"
    case rehoboam = "4.5 litres"
    case methusela = "6 litres"
    case balthazar = "12 litres"
}

var myBottle: BottleSize = .jeroboam
print("Your \(myBottle) is \(myBottle.rawValue)")

// enumerations with Associated values

enum GameType {
    case fps(String)
    case rpg(String)
    case elderScrolls(Int)
}

var firstGame: GameType = .fps("Call of Duty III")
var newGame: GameType = .elderScrolls(6)

switch firstGame {
case .fps(let game):
    print("The FPS I am playing is \(game)")
case .rpg(let game):
    print("The RPG I am playing is \(game)")
case .elderScrolls(let version):
    print("I am playing The Elder Scrolls \(version)")
}

// -------------------------------------------------------------------
//                          Structs
// -------------------------------------------------------------------

struct Movie {
    //properties
    var title: String
    var director: String
    var releaseYear: Int
    var genre: String
    
    //methods
    func summary() -> String {
        return "\(title) is a \(genre) released in \(releaseYear) that was directed by \(director)."
    }
}
var first = Movie(title: "Arrival", director: "Denis Villenueve", releaseYear: 2016, genre: "Science Fiction")
var second = Movie(title: "Sing Street", director: "John Carney", releaseYear: 2017, genre: "Musical Comedy")

print(first.title)
print(second.title)
second.releaseYear = 2016
print(second.releaseYear)

print(first.summary())
print(second.summary())

// -------------------------------------------------------------------
//                         Dictionaries
// -------------------------------------------------------------------

// keys and values are up to us, whereas in an array they are indexes.
//dictionary literal
var airlines = ["SWA": "Southwest Airlines",
                "BAW": "British Airways",
                "BHA": "Bhudda Air",
                "CPA": "Cathay Pacific"]

//use a [ ] to look up a key
if let choice = airlines["SWA"] {
    print(choice)
} else {
    print("No matching airline")
}
//Add or change
airlines["DVA"] = "Discovery Airlines"
// ^^ Looks for DVA, if found changes the value, if not adds to the dictionary
airlines
//remove by setting to nil
airlines["DVA"] = nil
airlines

//iterate over dictionary
for airline in airlines {
    print(airline)
}

//dictionary of type String keys and String values
var restaurants: [String: String]
//dictionary of Int keys and String values
var employees: [Int: String]
//

// -------------------------------------------------------------------
//                         Tuples
// -------------------------------------------------------------------

//tuples are multiple parameters in a single variable or constant
//they are not type inferred, so they can contain any type.
for (code, airline) in airlines {
    print(airline + code)
}

var cameraType = "Cannon"
var photoMode = true
var shutterSpeed = 60
var iso = 640
var aperature = "f1.4"

var basicTuple = (aperature, iso, cameraType)
let anotherTuple = (iso, "whatever you want", 564783, ["hold":"this"])

print(anotherTuple.3)

// returning a tuple from a function
                        // You can give the returned values names
func randomAlbum() -> (albumName: String, length: Int){
    let title = "And in the endless pause came the sound of bees"
    let duration = 2462
    
    return (title, duration)
}

// set the return tuple as a constant
let thisResult = randomAlbum()
print(thisResult)
print(thisResult.0) // call by index
print(thisResult.albumName) // or by name

// or return the tuple itself under different names
//and you can access the values by their name assigned here.
let (albumName, length) = randomAlbum()
print("The song you are listening to is: \(albumName)")
print("And it is \(length/60)m \(length%60)s long")

// use tuples to access dictionaries (ie, the airlines dictionary above)
airlines
for (firstIsKey, secondIsValue) in airlines {
    print("The key is \(firstIsKey), and the value is \(secondIsValue)")
}

// -------------------------------------------------------------------
//                             Closures
// -------------------------------------------------------------------

// its a chunk of code wrapped in { ... } to be passed into something else.

// Create a Book Struct
struct Book {
    var title: String
    var authorLastName: String
    var authorFirstName: String
    var readingAge: Int
    var pageCount: Int
}
// Create books with the struct
let book1 = Book.init(title: "Where the wild things are", authorLastName: "Sendak", authorFirstName: "Maurice", readingAge: 4, pageCount: 48)
let book2 = Book.init(title: "The Little Princess", authorLastName: "de-Saint-Expuery", authorFirstName: "Antoine", readingAge: 10, pageCount: 96)
let book3 = Book.init(title: "Oh, The Places You'll Go", authorLastName: "Seuss", authorFirstName: "Dr.", readingAge: 10, pageCount: 56)
let book4 = Book.init(title: "Goodnight Moon", authorLastName: "Wise Brown", authorFirstName: "Margaret", readingAge: 1, pageCount: 30)
let book5 = Book.init(title: "The Hobbit", authorLastName: "Tolkien", authorFirstName: "J.R.R", readingAge: 12, pageCount: 300)
//put the books in an array
let allBooks = [book1, book2, book3, book4, book5]
// our sorting function that sorts by readingAge descending
func compareTwoBooks(firstBook: Book, secondBook: Book) -> Bool {
    if firstBook.readingAge <= secondBook.readingAge {
        return true
    } else {
        return false
    }
}
// Pass the sorting function into the sortedBy method
let ageSortedBooks = allBooks.sorted(by: compareTwoBooks)
ageSortedBooks
// now do it with a closure passed into the sorted by function
let pageSortedBooks = allBooks.sorted(by: {
    (firstBook: Book, secondBook: Book) -> Bool
    in
    if firstBook.pageCount >= secondBook.pageCount {
        return true
    } else {
        return false
    }
})

//that is awfully wordy, lets shorten it down
    //instead of passing the closure inside of the method, lets place it after
    // this is called a trailing closure.
    // You don't even need the parenths (by: )
    // and if the statement returns true of false anyways, then why take a redundant if else statement?
    // the return is redundant as well!
    // now the same process as above is shortened to a single line of code.
let pageSortedBooks2 = allBooks.sorted { $0.readingAge >= $1.readingAge }
let pageSortByReadingAge = allBooks.sorted { $0.readingAge <= $1.readingAge }
let pageSortByLastName = allBooks.sorted { $0.authorLastName.uppercased() <= $1.authorLastName.uppercased() }

// filter by reading age less than 10
let filteredBooksByAgeOf10 = allBooks.filter { $0.readingAge < 10 }
filteredBooksByAgeOf10

// ------------------------------------------------------------------
//                       Classes and Objects
// -------------------------------------------------------------------

// Defining and instantiating classes
class Appliance {
    //properties
    var manufacturer: String
    var model: String
    var voltage: Int
    var capacity: Int?
    
    //initializer
    init() {
        self.manufacturer = "default manufacturer"
        self.model = "default model"
        self.voltage = 120
    }
    //additional initializer
    init(withVoltage: Int){
        self.manufacturer = "default manufacturer"
        self.model = "default model"
        self.voltage = withVoltage
    }
    //custom full initializer
    init(manuf: String, model: String, volts: Int) {
        self.manufacturer = manuf
        self.model = model
        self.voltage = volts
    }
    
    //deninitializers       --not required. only allowed in a class
    deinit {
        // perform cleanup code here
        // release a file resource
        // release a network resource
    }
    
    //methods
    func getDetails() -> String {
        var message = "This is a \(self.model) from \(self.manufacturer). "
        if self.voltage >= 220 {
            message += "This model is intended for European Usage."
        }
        return message
    }
}

// Later... we create instances of this Appliance class.
var kettle = Appliance()
kettle.manufacturer = "Megappliance, Inc"
kettle.model = "TeaMaster 5000"
kettle.voltage = 120
print(kettle.getDetails())

var macBook = Appliance(withVoltage: 260)
print(macBook.getDetails())

var iMac = Appliance(manuf: "Apple", model: "iMac 2015", volts: 120)
print(iMac.getDetails())

// These look a lot like structs, and are very similar
// But the difference is:
// Structs are value types
    // which means that when assigning it a new var or const,
    // the value is copied
// Classes are reference types
    // value is not copied, a new reference is passed.

// -------------------------------------------------------------------
//                     Value vs Reference
// -------------------------------------------------------------------

// a swift string is a struct -- a value type
var thisString = "This is some text"
// if I assign, its a copy of the original value
var thatString = thisString
// if I change, it only changes the copied value
thatString += ", and some extra text here"
// this does not effect the original
print(thisString)
print(thatString)

// a swift class -- a reference type
class Message {
    var internalText = "This is some reference type text"
}
// create a new instance of the class
var firstMessage = Message()
// if I assign, it's a reference to the original instance
var secondMessage = firstMessage
secondMessage.internalText += ", with an extra bit at the end here."
// see how it changed both the second and original?
print(firstMessage.internalText)
print(secondMessage.internalText)


// -------------------------------------------------------------------
//                        Inheritance
// -------------------------------------------------------------------

class Programmer {                              //======Superclass
    var githubName: String
    var primaryLanguage: String
    var devComputer: String
    var yearsInProgramming: Int
    init() {
        githubName = "Github Username"
        primaryLanguage = "default Language"
        devComputer = "development computer"
        yearsInProgramming = 0
    }
    init(github: String, lang: String, computer: String, years: Int) {
        self.githubName = github
        self.primaryLanguage = lang
        self.devComputer = computer
        self.yearsInProgramming = years
    }
    func message() -> String {
        var devLevel: String
        switch Int(self.yearsInProgramming) {
        case 0:
            devLevel = "Junior Developer"
        case 1:
            devLevel = "Apprentice Developer"
        case 2, 3, 4, 5:
            devLevel = "Software Developer"
        case 6...100:
            devLevel = "Senior Developer"
        default:
            devLevel = "Lying Developer"
        }
        let thisMessage = "Hi, I am a \(devLevel) with \(self.yearsInProgramming) years of experience. I use a \(self.devComputer) to code on and my primary coding language is \(self.primaryLanguage)."
        return thisMessage
    }
}
// define a new class
// this class inherits the above properties, methods, and initializers; but you can make new ones as well.

class WebDeveloper: Programmer {                 //=======Subclass
    //add new properties
    var webpages: [String] = []
    //to add a new initialzier, you must override the init from the superclass
    override init() {
        super.init()
        webpages = []
    }
    init(github: String, lang: String, computer: String, years: Int, webpages: [String]) {

        super.init(github:github,lang:lang,computer:computer,years:years)
        self.webpages = webpages
    }
    //add a new method
    func myWebpages() {
        print("I have a few web projects to show you!")
    }
}


// -------------------------------------------------------------------
//                         Extensions
// -------------------------------------------------------------------

//extending methods for strings

extension String {
    func removeSpaces() -> String {
        let filteredCharacters = self.characters.filter { $0 != " " }
        return String(filteredCharacters)
    }
}

var book = "The Martian"
var potatoMessage = "I walked down the street to see my house in the distance."
var tomatoMessage = "It was a very boring event. I shouldn't have done it."

print(potatoMessage.removeSpaces())
print(tomatoMessage.removeSpaces())
print(book.removeSpaces())

// -------------------------------------------------------------------
//                     Computed Properties
// -------------------------------------------------------------------

















