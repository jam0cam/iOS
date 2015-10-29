// Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending(i: Int, j: Int) ->Bool {
    return i < j
}

let volunteersSorted = sorted(volunteerCounts, sortAscending)

println("Original values \(volunteerCounts)")
println("Sorted values \(volunteersSorted)")


let vSorted = sorted(volunteerCounts, {
    (i: Int, j: Int) -> Bool in
    return i < j
})


println("Sorted values using closures \(vSorted)")


let vSorted2 = sorted(volunteerCounts, {i,j in i<j})
println("Sorted values with better shortcut \(vSorted2)")


//****************** Functions as Return Types ******************


func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return toLights +  lightsToAdd
    }
    
    return buildRoads
}

var stopLights = 4
let townPlan = makeTownGrand()
stopLights = townPlan(4, stopLights)
println("The town now has \(stopLights) stop lights!")


func makeTownGrand(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights +  lightsToAdd
        }
        
        return buildRoads
    } else {
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool{
    return budget > 10000
}

stopLights = 4

if let townPlan2 = makeTownGrand(1000, evaluateBudget) {
    stopLights = townPlan2(4, stopLights)
}

println("The town has \(stopLights) stop lights")






//****************** Clousres captures values ******************
func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> Int {
        totalGrowth += growth
        return totalGrowth
    }
    
    return growthTracker
}

var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)

println("Current population \(currentPopulation)")
growBy500()
growBy500()
growBy500()
currentPopulation += growBy500()
println("Current population \(currentPopulation)")





//****************** Challenge ******************
let totalVolunteers = volunteerCounts.reduce(0, combine:{
    (i: Int, j: Int) -> Int in
    return i+j
    }
)

println("total volunteers \(totalVolunteers)")




let total = volunteerCounts.reduce(0, combine: {i,j in i+j})
println("total volunteers \(total)")

let total2 = volunteerCounts.reduce(0, combine: {$0 + $1})
println("total volunteers \(total2)")






















