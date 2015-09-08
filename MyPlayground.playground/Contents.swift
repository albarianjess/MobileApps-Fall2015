//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//--------------------
//      Optionals
//--------------------

// optionals may or may not have a value now or in future
// if it doesn't have a value, it equals nil (absence of a value)
// ex: add ? to end
var score : Int?    //has value of nil
score = 45

if score != nil {
    println("There's a score")
} else {
    println("nil")
}


//--------------------
// unwrapping: using !
//--------------------
if score != nil {
    println("The score is \(score!)")
}


//--------------------
// conditionally unwrap: optional binding
// assign to temp variable
//--------------------
if let currentScore = score {
    println("My score is now \(currentScore)")
}


// let = constant
// var = variable


//--------------------
// implicitly unwrapped
// optional: look at the !
// it force unwraps it
//--------------------
let myScore : Int! = 95
println("My score is \(myScore)")

//--------------------
//    Functions
//--------------------

func sayHello() {
    println("Hello!")
}

sayHello()


// parameters: first of type string, last of type string (internal parameter)
//firstName and lastName are the external parameter: must use when calling function
func hello(firstName first: String, lastName last: String) {
    println("Hello \(first) \(last)!")
}

hello(firstName: "Jessie", lastName: "Albarian")

// # makes variable internal and external parameter
func whyHello(#firstName: String, #lastName: String) {
    println("Hello \(firstName) \(lastName)!")
}

whyHello(firstName: "Jessie", lastName: "Albarian")



func function(#firstName: String, #lastName: String) -> String {
    return "Hello " + firstName + " " + lastName
}

println(function(firstName: "Jess", lastName: "Alba"))



//---------------
//   Classes
//---------------

class Vehicle{
    var noOfWheels    = 4
    var speed         = 25
    var mph           = 20
    let tankCapacity  = 20
    var vehicleName : String?          //optional string ?
    func changeSpeed(amount: Int){
        speed = speed + amount
    }
    init(){}
    
    init(vehicleName vname: String){
        name = vname
    }
}

let myJeep = Vehicle()  // create an object called myJeep of class Vehicle: initialize it
myJeep.mph              // has value 20
myJeep.speed            // has value 25
myJeep.changeSpeed(10)  // function changeSpeed called; passes in 10
myJeep.speed            // new value of 35

class Counter {
    var count = 0
    func incrementBy(amount: Int, num: Int){
        count=count + amount * num
    }
    init(){}
}

let myCounter = Counter() // create an object called myCounter of class Counter: initilize it
myCounter.count
myCounter.incrementBy(10, num: 2)
myCounter.count





let myHybrid = Vehicle(vehicleName: "Prius")
myHybrid.name






