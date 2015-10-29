struct Stack<T> {
    var items = [T]()
    
    mutating func push(newItem: T) {
        items.append(newItem)
    }
    
    mutating func pop() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeLast()
        }
    }
    
    func map<U>(f: (T) -> (U)) -> Stack<U> {
        var mappedItems = [U]()
        
        for item in items {
            mappedItems.append(f(item))
        }
        
        return Stack<U>(items: mappedItems)
    }
}

var intStack = Stack<Int>()

intStack.push(3)
intStack.push(4)
intStack.push(5)
intStack.push(6)

println(intStack.pop()!)
println(intStack.pop()!)
println(intStack.pop()!)
println(intStack.pop()!)
println(intStack.pop())

var stringStack = Stack<String>()

stringStack.push("A")
stringStack.push("B")
stringStack.push("C")
stringStack.push("D")
stringStack.push("E")

println(stringStack.pop())


func myMap<T, U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    
    return result
}



let strings = ["one", "two", "three"]
let stringLengths = myMap(strings, {countElements($0)})
println(stringLengths)


intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map({2 * $0})

println(doubledStack.pop()!)
println(doubledStack.pop()!)


//Type constraints

func checkIfEqual<T: Equatable> (first: T, second: T) -> Bool {
    return first == second
}

println(checkIfEqual(1,1))
println(checkIfEqual("hello", "hello"))
println(checkIfEqual("hello", "hello world"))



//Bronze Challenge
struct MyStack<T> {
    var items = [T]()
    
    mutating func push(newItem: T) {
        items.append(newItem)
    }
    
    mutating func pop() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeLast()
        }
    }
    
    func filter(f: (T) -> (T?)) -> Stack<T> {
        var filteredItems = [T]()
        
        for item in items {
            var rval: T? = f(item)
            
            if let a = rval {
                filteredItems.append(a)
            }
        }
        
        return Stack<T>(items: filteredItems)
    }
}

var stack = MyStack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)
stack.push(6)

var resultStack = stack.filter({ (item1: Int) -> Int? in
    if item1 % 2 == 0 {
        return item1
    } else {
        return nil
    }
})


println(resultStack.pop()!)
println(resultStack.pop()!)
println(resultStack.pop()!)



//Silver Challenge
func findAll<T: Equatable> (list: [T], target: T) -> [Int] {
    var result = [Int]()
    
    for (index,obj) in enumerate(list) {
        if obj == target {
            result.append(index)
        }
    }
    
    return result
}

println(findAll([5,3,7,3,9], 3))








