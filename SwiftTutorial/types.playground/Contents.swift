// By: kgbercan
// Updated 11 Feb 2016
// Objective: to play with basic types in Swift



/* This section shows you how
    to get started             */

// This is how you declare a variable/constant
let prop: String
// The next line causes an error because it does not have a type
// let maximum

// This is how you declare and initialize a variable/constant
var count: Int = 1
// You don't need a type annotation; it's inferred
var favColor = "yellow"




/* This section demonstrates
    type safety              */

// Ints **pretend** they can be assigned to Doubles, but not vice versa
var i = 1
var j = 1.2
j = 1
// j is actually still a Double, even though a human wouldn't consider it a number with a fraction

// The next line gives an error, unless we cast the number
// i = 4.3563
i = Int(4.3563)
// But that changes the value...it always rounds down
print(i)
i = Int(-67.9)
print(i)

// The next line won't run because you can't assign an Int to a var holding a String
// favColor = count

// You have to cast a String to an Int to add "5" and 6
// x = "5" + 6
// Remember to unwrap the optional when you cast the String to an Int
var x = Int("5")! + 6
print("This is an int: \(x)")
// adding Ints does the operation, but adding Strings concatenates them
var xString = "5" + String(6)
print("This is a String: \(xString)")




/* This section is about
    using tuples         */

// Create a tuple like this
var tree: (String,String)
tree = ("Oak","Northeast")

// This works too
var pet = ("Fluffy", "female", 2)
// Decompose a tuple by naming each component
var (name, sex, age) = pet
print(name)
print(sex)
print(age)

// Another way
let size = (letter: "M", number: 8)
print(size.letter)
print(size.number)
// Decompose by intexing
print(size.0)
print(size.1)

// If you only need one component
let areaCode = (617, "Boston", "MA")
let (_, city, _) = areaCode
print(city)




/* This section is about
    using optionals      */

var z = "z"
var y = Int(z) // Swift infers that this is an optional
// z can never be an Int, so y holds nil
// nil doesn't need to be unwrapped
print(y)

var one = "1"
var h = Double(one)
// If you don't unwrap it, it prints "Optional" with the value
print(h)
print(h!)

// h's type is Double? with the question mark indicating it's an optional
h = 2
// It's still a Double? even though it holds 2, and it can hold nil
h = nil

// You can create an optional right off the bat
var b: Bool? = false
b = true
b = nil




/* This section is about
    using arrays      */

// An array of integers
var arry = [Int]()
// or
var aRRY = [1, 2, 3]

// Add items
arry.append(10)
arry += [20]
let firstItem = aRRY[0]

// Insert (this does not replace)
arry.insert(1, atIndex: 0)
// But it cannot be bigger than the original array
// Index 3 would be okay but 4 breaks the code:
// arry.insert(1, atIndex: 4)

// Remove the second item
arry.removeAtIndex(1)

// Walk through the array
for index in arry{
    print(index)
}




/* This section is about
    using sets          */

// Declaring a set
var catNames = Set<String>()

// Swift can infer from these values that it's a set of Strings
var genres: Set = ["romance", "science fiction", "comedy"]

// Add values
catNames.insert("Nimitz")
catNames.insert("Roxi")
catNames.insert("Joey")

// Remove
catNames.remove("Roxi")

// Walk through the set
// Add sort() to print a sorted list
for cat in catNames.sort(){
    print(cat)
}




/* This section is about
    using dictionaries   */

// A few new dictionaries
var seasons = [String: String]()
var airports: [String: String] = ["BOS": "Logan", "GRU": "Guarulhos", "GIG": "Galeao"]
var arCodes = [978: "North Shore", 617: "Boston", 603: "New Hampshire"]

// Add a new key:value pair
seasons["summer"] = "flip flops"
seasons["winter"] = "boots"

// Change the values of keys
airports["GIG"] = "Rio de Janeiro"

// You can also chang it like this, which also returns the old value
// If the key doesn't exist, it will be created and the method will return nil
airports.updateValue("Miami", forKey: "MIA")

// The print method prints "ugly" :)
print(airports)

// To find a value using a key
let loc = arCodes[978]

// To remove a value
arCodes[603] = nil
// But also return the value
let mia = airports.removeValueForKey("MIA")

// To walk through a dictionary
for (season, shoes) in seasons{
    print(shoes)
}
for season in seasons.keys{
    print(season)
}
// Now in order
for shoes in seasons.values.sort(){
    print(shoes)
}
