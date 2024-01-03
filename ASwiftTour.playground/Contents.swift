// Code and stuff from 'A Swift Tour' (https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour)

import Cocoa

print("Hello world!")

//
// Simple Values
//

// var = variable... can be mutated
// let = constant

var myVariable = 42     // type is inferred from initialiser value
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70     // type manually set
let explicitFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5

// Evaluate variable inside string - use \(variable)

let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let myFloat: Float = 99.9
let someonesName = "Bob Squash"
print("Hello \(someonesName) - your number is \(myFloat)")

// Multi-line strings - use triple quotes

let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
"""

// Array

var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"

// Dictionary

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"

fruits.append("blueberries")
print(fruits)

// Array and dictionary initialisation

fruits = []
occupations = [:]

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

//
// Control flow
//

let individualScores = [74, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {     // Array iterator
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}

print("Score: ", teamScore, scoreDecoration)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello \(name)"
} else {
    greeting = "Hello unknown"
}

let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

if let nickname {
    print("Hey, \(nickname)")
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestType = ""
for(type, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestType = type
        }
    }
}
print(largest)
print(largestType)

// Mine - getting a substring by indeices
let myString = "This is the end"
let start = myString.index(myString.startIndex, offsetBy: 5)
let end = myString.index(start, offsetBy: 2)
let sub: String = String(myString[start..<end])
print(sub)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
            for i in 0..<4 {
    total += i
}
print(total)

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("Bob", on: "Tuesday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Functions are first-class objects

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

// function passed as argument

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// un-named function object - a closure

numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})

// concise closure syntax

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// closure parameters by number

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
