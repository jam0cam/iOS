// Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    println("hello world")
}

printGreeting()


func printPersonalGreeting(name: String) {
    println("hello \(name)")
}

printPersonalGreeting("Jia")

func divisionDescription(num: Double, den: Double)
{
    println("\(num) divided by \(den) is \(num/den)");
}

divisionDescription(8,3)


func divisionDescription2(numerator num: Double, denominator den: Double)
{
    println("\(num) divided by \(den) is \(num/den)");
}

divisionDescription2(numerator: 8, denominator: 3)

func divisionDescription3(#numerator: Double, #denominator: Double)
{
    println("\(numerator) divided by \(denominator) is \(numerator/denominator)");
}

divisionDescription3(numerator: 8, denominator: 3)


//******************* Variadic Parameters ********************

func printNames(names: String...) {
    for name in names {
        println(name)
    }
}

printNames("Jia", "Rafael", "Hina")

//******************* Default Parameters ********************


func printName(name : String = "Jia" ) {
    println("hello \(name)")
}

printName(name: "Rafael")
printName()

//******************* in/out Parameters ********************
var error = "The request has failed:"
func appendErrorString(#errorCode: Int, inout #errorString: String) {
    if errorCode == 400 {
        errorString += " bad request"
    }
}

appendErrorString(errorCode: 400, errorString: &error)
println(error)




//******************* Function returning values ********************
func getGreeting(name: String) -> String {
    return "Hello \(name)"
}

println(getGreeting("Jia"))


func areaOfTriangle(base: Double, height: Double) -> Double {
    let numerator = base * height
    
    func divide() -> Double {
        return numerator / 2
    }
    
    return divide()
}

println("The area of the triangle is \(areaOfTriangle(4,8))")



//******************* Returning multiple values ********************
func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers{
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    
    return (evens, odds)
}


let sortedNumbers = sortEvenOdd([1,2,3,4,5,6,7,8,9,10])

println("Sorted evens: \(sortedNumbers.evens)")
println("Sorted odds: \(sortedNumbers.odds)")



//******************* Optional Return Types ********************
func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

println(grabMiddleName(("Jia", "Jun", "Tse")))
println(grabMiddleName(("Jia", "Jun", "Tse"))!)
println(grabMiddleName(("Jia", nil, "Tse")))

let middleName = grabMiddleName(("Jia", nil, "Tse"))
if let theName = middleName {
    println(theName)
} else {
    println("There is no middle name")
}



let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortEvenOdd




//******************* Challenge ********************

func beanSifter(#groceryList : [String]) -> (beans: [String], otherGroceries: [String]) {

    var otherGroceries = [String]()
    var beans = [String]()
    
    for grocery in groceryList{
        if grocery.rangeOfString("bean") == nil {
            otherGroceries.append(grocery)
        } else {
            beans.append(grocery)
        }
    }
    
    return (beans, otherGroceries)
}

var sifted = beanSifter(groceryList: ["green beans", "milk", "black beans", "pinto beans", "cheese", "corn", "lima beans", "apples"])


println("beans: \(sifted.beans)")
println("other groceriesq: \(sifted.otherGroceries)")







