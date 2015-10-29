

func printTable(data: [[Int]]) {
    for row in data{
        var out = ""
        for item in row {
            out += " \(item) |"
        }
        
        println(out)
    }
}

func printTable(rowLabels: [String], data: [[Int]]) {
    //determine length of longest row label
    let maxRowLabelWidth = maxElement(rowLabels.map {countElements($0)})
    
    for (i, row) in enumerate(data) {
        //Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - countElements(rowLabels[i])
        var out = rowLabels[i] + Repeat(count: paddingAmount, repeatedValue: " ") + " |"
        
        for item in row {
            out += " \(item) |"
        }
        
        println(out)
    }
    
}



func printTable(rowLabels: [String], columnLabels: [String], data: [[Int]]) {
    //determine length of longest row label
    let maxRowLabelWidth = maxElement(rowLabels.map {countElements($0)})
    
    //create first row containing hearders
    var firstRow: String = Repeat(count: maxRowLabelWidth, repeatedValue: " ") + " |"
    
    //also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(countElements(columnHeader))
    }
    
    println(firstRow)
    
    for (i, row) in enumerate(data) {
        //Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - countElements(rowLabels[i])
        var out = rowLabels[i] + Repeat(count: paddingAmount, repeatedValue: " ") + " |"
        
        for (j, item) in enumerate(row) {
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - countElements(itemString)
            out += Repeat(count: paddingAmount, repeatedValue: " ") + itemString
        }
        
        println(out)
    }
    
}


let rowLabels = ["Joe", "Karen", "Fred"]
let columnLabels = ["Age", "Years of Experience"]
let data = [
    [30, 6],
    [40, 18],
    [50, 20]
]

printTable(data)
printTable(rowLabels, data)
printTable(rowLabels, columnLabels, data)



struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

protocol TabularDataSource {
    var numberOfRows: Int {get}
    var numberOfColumns: Int {get}
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    func itemForRow(row: Int, col: Int) -> Int
}



struct Department: TabularDataSource, Printable {
    let name: String
    var people = [Person]()
    
    mutating func addPerson(person : Person) {
        people.append(person)
    }
    
    var numberOfRows : Int {
        return people.count
    }
    
    var numberOfColumns : Int {
        return 2
    }
    
    var description: String {
        return "Department(\(name))"
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }

    func labelForColumn(column: Int) -> String {
        switch column{
        case 0:
            return "Age"
        case 1:
            return "Years of Experience"
        default:
            fatalError("Invalid Column!")
        }
    }
    
    func itemForRow(row: Int, col: Int) -> Int {
        let person = people[row]
        switch col {
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("Invalid Column!!!")
        }
    }
}




func printTable(datasource: TabularDataSource) {
    //determine length of longest row label
    let maxRowLabelWidth = maxElement(map(0 ..< datasource.numberOfRows, {
            countElements(datasource.labelForRow($0))
    }))
    
    //create first row containing hearders
    var firstRow: String = Repeat(count: maxRowLabelWidth, repeatedValue: " ") + " |"
    
    //also keep track of the width of each column
    var columnWidths = [Int]()
    
    for c in 0 ..< datasource.numberOfColumns {
        let columnLabel = datasource.labelForColumn(c)
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(countElements(columnHeader))
    }
    
    println(firstRow)
    
    for r in 0 ..< datasource.numberOfRows {
        
        //Pad the row label out so they are all the same length
        let rowLabel = datasource.labelForRow(r)
        let paddingAmount = maxRowLabelWidth - countElements(rowLabel)
        var out = rowLabel + Repeat(count: paddingAmount, repeatedValue: " ") + " |"
        
        for c in 0 ..< datasource.numberOfColumns {
            let item = datasource.itemForRow(r, col: c)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[c] - countElements(itemString)
            out += Repeat(count: paddingAmount, repeatedValue: " ") + itemString
        }
        
        println(out)
    }
    
}


var department = Department(name: "Engineering", people: [])
department.addPerson(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))
department.addPerson(Person(name: "Gandolf", age: 5000, yearsOfExperience: 20))

printTable(department)
println(department)


