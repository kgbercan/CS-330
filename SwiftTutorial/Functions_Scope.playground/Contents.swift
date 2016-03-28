///////////////////
//// Functions ////
///////////////////

// this function squares an Int and returns an Int
func square(num: Int) -> Int{
    return(num*num)
}

var a = square(2)
print(a)
a = square(a)
print(a)

// this function takes two Strings and does not have a return value
func intro(friend1: String, friend2: String){
    print("\(friend1), this is \(friend2).")
}

intro("Adele", friend2: "Justin")

// using an external parameter name
func count(from n: Int, to m: Int, by o: Int){
    for i in n...m{
        if(i%o==0){
            print(i)
        }
    }
}

count(from: 4, to: 16, by: 3)

// variadic and default parameters
func count(n: Int..., m: Int = 1){
    for _ in 1...m{
        for num in n{
            print(num)
        }
    }
}

count(10,9,8, m: 2)

// two functions with the same name but different types
func type(c: Int){
    print("The argument is an Int.")
}

func type(c: String){
    print("The argument is a String.")
}

type(1)
type("1")


// but I want to return multiple things!!!!
func word(n: String) -> (first: Character, last: Character, len: Int){
    let f = n[n.startIndex]
    let l = n[n.endIndex.predecessor()]
    let len = n.characters.count
    return(f,l,len)
}

let w = word("Super")
print("The first letter of this word is \(w.first). The last is \(w.last). It is \(w.len) letters long.")

// getting meta w functions and passing them as arguments
func half(j: Double) -> Double{
    return j/2
}
func printHalf(half: (Double) -> Double, i: Double){
    print(half(i))
}

printHalf(half, i: 45)

//recursion
func makeZero(number: Int){
    var i = number
    if i < 0{
        i += 1
        makeZero(i)
    }
    else if i > 0 {
        i -= 1
        makeZero(i)
    }
    else{
        print(i)
    }
}

makeZero(5)




///////////////////
////// Scope //////
///////////////////

// variable in a loop
var b = "b"
//prints b
print("before loop, b = : \(b)")
if(3<4){
    var b = "abc"
    //prints abc
    print("in loop, b = : \(b)")
}
//prints b
print("after loop, b = : \(b)")


// in-out parameters
func changeLetter(inout d: String) -> String{
    d = "d"
    print("in function, d = : \(d)")
    return(d)
}
var c = "c"
//prints c
print("before function, c = : \(c)")
changeLetter(&c)
print("after function, c = : \(c)")

// passing by value
var d = ["c","a","t"]
var e = ["d","o","g"]
d=e
e[1] = "u"
for dd in d{
    print(dd)
    // prints dog
}
for ee in e{
    print(ee)
    // prints dug
}