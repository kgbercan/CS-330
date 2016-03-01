// Conditionals

// If

var temp = 50
if temp <= 40 {
    print("It's cold. You should wear a scarf.")
}
else if 40 < temp && temp <= 55 {
    print("It's not too cold out, but wear a jacket.")
}
else {
    print("It's warm!")
}

// Switch

var state = "MA"
switch state{
case "IL","IN","MI","OH","WI","IA","KS","MN","MO","NE","ND","SD":
    print("Midwest")
case "NJ","NY","PA", "RI":
    print("Middle Atlantic")
case "CT","ME","MA","NH","VT":
    print("New England")
    fallthrough
case "Somewhere in New England":
    print("New England is the best region in the country.")
default:
    print("That is not an American state, or I was too lazy to type all the abbreviations. Sorry.")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Loops

// For-in
for _ in 1...3{
    print("Betelgeuse")
}

var alpha = ["A","B","C","D"]
for letter in alpha{
    print(letter)
}

// For

// these for loops row crew
for var meters = 0; meters < 2000; meters += 10{
    print("Legs, body, arms\nArms, body, legs\n\n")
}

var m = 0
for m = 0; m < 500; m += 50{
    print("We are in the sprint\n\n")}
print("Good job--you sprinted your last \(m) meters.")

// While
var allergic = true
while allergic{
    print("You can't get a cat if you are allergic!")
    allergic = false
}

// Repeat While
repeat{
    print("I thought you were allergic to cats...")
    allergic = true
} while !allergic



// Control Transfer

// Continue
var reps = 10;
while reps < 15{
    reps++
    if reps == 13{
        print("I want to skip this one")
        continue
    }
    print(reps)
}

// Break
let age = 13
switch age{
case 5...11:
    print("You are in elementary school.")
case 12...17:
    // teenagers are hard to talk to
    break
case 18...25:
    print("You may be persuing higher education")
default:
    print("You are likely not in school anymore.")
}



// Other stuff to think about

// An example of limited scope
let animal = "dog"
if animal == "dog"{
    var points = 100
}
else{
    print("It's okay to be a cat person")
}
// points was declared inside the if statement, and now that we are out, we cannot access it!
// the following line gives an error
// print(points)

// An example of short-circuit logic, which does not work in Swift
var height = 70
var weight = 170
/* if height/12 >= 6 || weight/0 == 100{
    print("You will never get to this point because you cannot divide by zero and Swift is mad at you for trying.")
} */

