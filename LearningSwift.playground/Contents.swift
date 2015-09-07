//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var name : String = "Jessie"
println("Hellloooooo Worrrrllldd from " + (name));
//var abs : Character =

var yesorno : Bool = true;
println(yesorno)

var message : String = "Hello class!"   //variable message of type string
let classSize : Int = 20;                //let is like a constant
var average : Double = 88.25;
//let grades[4] : Int = [90, 85, 92, 76];

//for (var i : Int = 0; i < grades[i]; i++){
    
//}

println(\(average))



let scores = (89.5, 60, 99.9);
println(scores.0) //grabs index 0
println(scores.1) //grabs index 1


var num : Int = 5;
var i : Int;
var count : Int = 0;

for (i = 0; i < 25; i++){
    num = count++
    println(num)
}


//(a..b) closed range includes a and b
//(a..<b) half open range includes a but not b


var temp = 30
if temp < temp {
    println("It's cold")
} else if temp >= temp {
    println("Temp is nice.")
}




var number : Int = 4;
switch number {
case 0...5:
    println("The number is between 0 and 5")
case 6...10:
    println("The number is between 6 and 10")
default:
    println("I dono what the number is")
}



//
//arrays - ordered collection of values
//
//var list = Array<String>()
//var list = [String]()
var list = ["juice", "cereal"]
    //properities
    // .count returns number of items in an array
    // .isEmpty is a boolean to see if count is zero

list.append("bread")                //adds to end of list
println(list)
list[0] = "orange"                  //
//list+= ["chocolate", "butter"]      //adds to list
//list.insert("coffee", atIndex:0)    //inserts item into array

//let juice = list.removeAtIndex(0)   //returns value that was removed
//let item = list.removeLast()        //returns value that was removed


//for-in loops
for item in list {
    println(item)
}

//--------------
//   Sets
//--------------
//unordered; can't count on it's order (might change); can't have duplicates!

//var clothes=Set<String>()
//var clothes:Set=["shirt","shorts"]
//clothes.insert("jeans")
//clothes.remove("shorts")
//let item=clothes.contains("shirt")  //returns boolean if it's in the set



//--------------
//   Dictionaries
//--------------
//key : value pairs ; use key to look up value (not the other way around)

//var classes=Dictionary<String, String>
//var classes=[String: String]
//var classes:[String: String]= "Yes" : "No", "Up" : "Down"]

//classes["Yes"] = "MIT"
//classes.updateValue("GO", forKey: "Yes")
//classes.removeValueForKey("Yes")

//for (num, name) in classes {
//    println("\(num) : \(name)")
//}

//.count        returns number of items in dictionary
//.isEmpty      boolean to see if count is 0
//.keys         returns all keys
//.values       returns all values




