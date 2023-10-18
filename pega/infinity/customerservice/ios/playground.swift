import UIKit

var greeting = "Hello, playground"
print(greeting)
print("Hello World")
var myVariable = 42
myVariable = 50
let myConstant = 10
print(myConstant)
//let myConstant = 11
let label = "The width is "
let width = 94
let widthLabel = label+String(width)
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples+oranges) pieces of fruit"

let quotation = """
    Eventhouh there is a whitespace to the left,
    the actual lines are not intended.
    Except for this line.
    Double quotes (") can appear without being escaped.
    I have still \(apples+oranges) of fruit
"""
print(quotation)

var fruits = ["strawberries","apples","grapes"]
fruits[0]

var occupations = [
    "Malcolm" : "Captain",
    "Kaylee" : "Mechanic"

]
occupations["Malcolm"]

fruits.append("blueberries")
print(fruits)

fruits=[]
occupations=[:]

let emptyArray:[String] = []
let emptyDictionary:[String:Float] = [:]

let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore+=3
    } else {
        teamScore+=1
    }
}
print(teamScore)

let scoreDecoration = if teamScore > 10 {
    "🎉"
    
} else {
    ""
}
print("Score:",teamScore,scoreDecoration)

var optionalString:String? = "Hello"
print(optionalString == nil)

var optionalName:String? = "John Appleseed"
greeting = "Hello"
if let name = optionalName {
    greeting = "Hello,\(name)"
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
    print("Everything tastes good in soup.")

}

let interestingNumbers = [
    "primes":[2, 3, 5, 7, 11, 13],
    "fibinocci":[1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for(_,numbers) in interestingNumbers {
    for number in numbers {
        if ( number > largest ){
            largest = number
        }
    }
}
print(largest)

func greet(person:String,day:String)-> String {
    return "Hello \(person), today is \(day)"
}
greet(person: "Guru", day: "Monday")

func calculateStatistics(scores:[Int])->(min:Int,max:Int,sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        }
        if score < min {
            min = score
        }
        sum+=score
    }
    return (min,max,sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

