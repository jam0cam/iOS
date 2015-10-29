typealias Velocity = Double

extension Velocity {
    var kph: Velocity {
        return self * 1.60934
    }
    
    var mph: Velocity {
        return self
    }
}


protocol VehicleType {
    var topSpeed: Velocity {get}
    var numberOfDoors: Int {get}
    var hasFlatBed: Bool {get}
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickName: String
    
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0, "New value must be between 0 and 1")
        }
    }
  }

extension Car: VehicleType {
    var topSpeed: Velocity {
        return 180
    }
    var numberOfDoors: Int {
        return 4
    }
    var hasFlatBed: Bool {
        return false
    }

}

extension Car {
    init(carMake: String, carModel: String, carYear: Int) {
        self.init(make: carMake,
            model: carModel,
            year: carYear,
            color: "Black",
            nickName: "N/A",
            gasLevel: 1.0)
    }
}


var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)


extension Car {
    enum CarKind: Printable {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:    return "Coupe"
            case .Sedan:    return "Sedan"
            }
        }
        
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}

println(c.kind.description)



extension Car {
    mutating func emptyGas(amount: Double) {
        precondition((gasLevel - amount) >= 0 && (gasLevel - amount) <= 1, "invalid amount to remove")
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(0.3)
println(c.gasLevel)
c.fillGas()
println(c.gasLevel)



//SILVER Challenge: extend INT to have a times 5 property
extension Int {
    var timesFive: Int {
        return self * 5
    }
}


var five: Int = 5
println(five)
println(five.timesFive)


c.emptyGas(0.5)
println(c.gasLevel)
c.emptyGas(0.4)



