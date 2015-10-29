// Playground - noun: a place where people can play

import Cocoa


var bucketList: Array<String> = [
    "Climb Mt. Everest"
]


bucketList.append("Fly hot air balloon to Fiji")
bucketList.append("What the Lord of the Rings trilogy in one day")
bucketList.append("Go on a walkabout")
bucketList.append("Scuba dive in the Great Blue Hole")
bucketList.append("Find a triple rainbow")

bucketList.removeAtIndex(2)
println(bucketList.count)
println(bucketList[2...4])

bucketList[2] += " in Austrailia"
println(bucketList[2...4])

bucketList[0] = "Climb Mt. Kilimanjaro"
println(bucketList[0...2])


//--------------------------appending another list to a list

var newItems = [
    "Watch TV",
    "Go to the gym",
    "Buy groceries",
    "Add gas"
]

bucketList.extend(newItems)

bucketList.insert("Hello World", atIndex:2)
println(bucketList[0...2])


//--------------------------Shows array inequality

var array1 = [
    "hello",
    "world"
]

var array2 = [
    "hello",
    "world"
]

println("The two arrays are \(array1 == array2) ")


//--------------------------Immutable arrays
let lunches = [
    "Cheeseburger",
    "Pizza",
    "Tacos",
    "Fried Chicken",
    "Spaghetti",
    "Fries",
]



//--------------------------Challenge
var toDoList = [
    "Take out the garbage",
    "Pay bills",
    "Cross off finished items"
]

println(toDoList);

//Check whether the list has items
if toDoList.isEmpty {
    println("The list is empty")
} else {
    println("The list is NOT empty")
}


//Use a loop to reverse the items in this list
var reverseList: Array<String> = []


for var i = toDoList.count-1; i >= 0; i-- {
    reverseList.append(toDoList[i])
}

println(reverseList)
toDoList = reverseList
println(toDoList)


//Use a library to reverse the list
var newReverseList: Array<String> = []
newReverseList = toDoList.reverse()
println(newReverseList)
