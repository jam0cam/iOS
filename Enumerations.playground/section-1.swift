// Playground - noun: a place where people can play

import Cocoa

enum TextAlignment {
    case Left
    case Right
    case Center
}


var alignment = TextAlignment.Left
alignment = .Center

println(alignment)

if alignment == .Center {
    println("Center aligned")
}


switch alignment {
case .Left:
    println("Left aligned")
case .Right:
    println("Right aligned")
case .Center:
    println("Center aligned")
default:
    println("Should never come here")
}


//**************** Raw Values ************************

enum Alignment : Int{
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

println("Justify have a raw value of \(Alignment.Justify.rawValue)" )

let myRawValue = 20
if let myAlignment = Alignment(rawValue : myRawValue) {
    println("Successfully converted \(myRawValue) into an Alignment")
}





//**************** Methods ************************


enum LightBulb {
    case On
    case Off
    
    func surfaceTemperature(ambient: Double) -> Double{
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}


var bulb = LightBulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(ambientTemperature)
println("The temperature of the bulb is \(bulbTemperature)")


bulb.toggle()

bulbTemperature = bulb.surfaceTemperature(ambientTemperature)
println("The temperature of the bulb is \(bulbTemperature)")






//**************** Associated Values ************************
enum ShapeDimensions {
    case Point
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    case RightTriangle(base: Double, height: Double, hypotenuse: Double)
    
    func area() -> Double {
        switch self {
        case let .Square(side):
            precondition(side >= 0, "Side cannot be negative")
            return side * side
        case let .Rectangle(width: w, height: h):
            precondition(w >= 0, "Side cannot be negative")
            precondition(h >= 0, "Side cannot be negative")
            return w * h
        case let .Point:
            return 0
        case let .RightTriangle(base: b, height: he, hypotenuse: hy):
            //area is b*h/2
            precondition(b*b + he*he == hy * hy, "base * base + height height must equal hypotenuse * hypotenuse")
            return (b * he)/2
        }
    }
    
    
    func perimeter() -> Double {
        switch self {
        case let .Square(side):
            return 4 * side
        case let .Rectangle(width: w, height: h):
            precondition(w >= 0, "Side cannot be negative")
            precondition(h >= 0, "Side cannot be negative")
            return w*2 + h*2
        case let .Point:
            return 0
        case let .RightTriangle(base: b, height: he, hypotenuse: hy):
            precondition(b*b + he*he == hy * hy, "base * base + height height must equal hypotenuse * hypotenuse")
            return b + he + hy
        }
    }
    
}

var squareShape = ShapeDimensions.Square(10.0)
var squareShape2 = ShapeDimensions.Square(-5.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point
var triangleShape = ShapeDimensions.RightTriangle(base: 3, height: 4, hypotenuse: 5)

println("The area of the square is \(squareShape.area())")

//uncomment the next line to see a runtime error with the above precondition
//println("The area of the square is \(squareShape2.area())")

println("The area of the rectangle is \(rectShape.area())");
println("The area of the point is \(pointShape.area())");
println("The area of the right triangle is \(triangleShape.area())");


println("The perimeter of the square is \(squareShape.perimeter())")
println("The perimeter of the rectangle is \(rectShape.perimeter())");
println("The perimeter of the point is \(pointShape.perimeter())");
println("The perimeter of the right triangle is \(triangleShape.perimeter())");










