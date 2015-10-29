// Playground - noun: a place where people can play

import Cocoa

//Different ways to initialize
var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()

var movieRatings = [
    "Donnie Darko":4,
    "ChungKing Express" : 5,
    "Dark City" : 4
]

println("I have rated \(movieRatings.count) movies")

let darkoRating = movieRatings["Donnie Darko"]

movieRatings["Dark City"] = 5


let oldRating = movieRatings.updateValue(5, forKey: "Donnie Darko")

if let lastRating = oldRating {
    println("Previous rating \(lastRating)")
}


//ADDING a value
movieRatings["The cabinet of Dr. Caligari"] = 5

println(movieRatings)


let removedRating : Int? = movieRatings.removeValueForKey("Dark City")

for (key, value) in movieRatings {
    println("The movie \(key) was rated \(value)")
}


for movie in movieRatings.keys {
    println("User has rated movie \(movie)")
}


//dictionary to arrays
let watchedMovies = Array(movieRatings.keys)
println("Watched movies \(watchedMovies)")


//challenge. Have a key value pair where the key is the 
//name of the county, and value is a list of zipcodes for that county
var counties = Dictionary<String, Array<Int>>()
counties["Clark"] = [1111,1111,1111,1111,1111]
counties["Orange"] = [2222,2222,22222,22222,22222]
counties["Boston"] = [33333, 33333, 33333, 33333, 33333]

println(counties)

println(counties["Orange"]!)










