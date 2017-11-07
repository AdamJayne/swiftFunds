// Learned using Pluralsight

var playerName = "Alice"     //String
var age = 21                 //Int
var temperature = 76.8       //float
var activeMembership = true  //boolean

age = age + 44

var bonusScore: Int      // type annotation

var sandwichType: String?

//loops

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

// range operators

let zeroThroughTenInclusive = 0...10  //inclusive range that includes the value on the right and left
let zeroThroughTenExceptTen = 0..<10  //excluding the value on the right (ten in this case)

for number in stride(from: 0, to: 100, by: 15) {  //strideTo does not include the final value
    print(number)
}
for number in stride(from: 0, through: 256, by: 16) { //strideThrough does include the final value
    print(number)
}


//string interpolation
let killed = "xXxBallinBoixXx"
let killedBy = "86_year_old"
let killedWith = "Frying Pan"
let byDistance = "3 meters"

let killMessage = "Player \(killed) was killed by \(killedBy) with weapon \(killedWith) from a distance of \(byDistance)"
print(killMessage)

//functions

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


// Enumerations

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

//Structs

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

//Dictionaries
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
airlines["DVA"] = "Discovery Airlines"   //Looks for DVA, if found changes the value, if not adds to the dictionary
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

//tuple
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


// Closures





