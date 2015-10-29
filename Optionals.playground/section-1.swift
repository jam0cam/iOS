// Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?
errorCodeString = "404"

if errorCodeString != nil {
    let theError = errorCodeString;
    println(theError)
}

//----------------Optional Binding

if let theError = errorCodeString {
    println(theError)
}


//----------------Optional Chaining

var errorString: String!
errorString = "404"
println(errorString)

var errorCodeInt: Int?
errorCodeInt = errorCodeString?.toInt()?.advancedBy(105)
println(errorCodeInt!)


if let errInt = errorCodeInt {
    println(errInt)
} else {
    println("There is no error message")
}



//--------------------Nil Coalescing operators

errorCodeString = "404"

var actualErrorCode: Int
if let errInt = errorCodeString?.toInt() {
    actualErrorCode = errInt
} else {
    actualErrorCode = 500
}

println("Actual error code: = \(actualErrorCode)")

let actualErrorCode2 = errorCodeString?.toInt() ?? 500
println("Actual error code 2: \(actualErrorCode2)")


//Challenge ------------

var challenge : Int?
challenge = nil


//UNCOMMENT the next LINE TO SHOW THE ERROR FOR THE CHALLENGE
//println(challenge!)