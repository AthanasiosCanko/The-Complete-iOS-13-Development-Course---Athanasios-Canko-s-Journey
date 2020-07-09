//
//  main.swift
//  advanced-swift-project
//
//  Created by Athanasios Canko on 3.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

let classJames = MusicianClass(nameInput: "James", ageInput: 50, instrumentInput: "Guitar")
var structJames = MusicianStruct(name: "James", age: 50, instrument: "Guitar")

classJames.age = 51
structJames.age = 51

//let copyOfClassJames = classJames
//var copyOfStructJames = structJames
//
//print(copyOfClassJames.age)
//print(copyOfStructJames.age)
//
//copyOfClassJames.age = 52
//copyOfStructJames.age = 52
//
//print(copyOfClassJames.age)
//print(copyOfStructJames.age)
//
//print(classJames.age)
//print(structJames.age)
//
//print(classJames.age)
//classJames.happyBirthday()
//print(classJames.age)
//
//print(structJames.age)
//structJames.happyBirthday()
//print(structJames.age)

// TUPLE
let myTuple = (1, 3)
print(myTuple.0)

var myTuple2 = (1, 3, 5)
myTuple2.2 = 10
print(myTuple2.2)

let myTuple3 = ("Atil", 100)
let myTuple4 = (10, [10, 20, 30])
print(myTuple4.1[1])

let predefinedTuple: (String, String)
predefinedTuple.0 = "Atil"
predefinedTuple.1 = "Sam"

let newTuple = (name: "Athanasios", age: 24)
print(newTuple.name)
print(newTuple.age)

// Guard Let vs If Let
// Guard -> Negative && Confident
// If -> Positive

let myNumber = "5"
func convertToIntegerGuard(stringInput: String) -> Int {
    guard let myInteger = Int(stringInput) else {
        return 0
    }
    return myInteger
}

func convertToIntegerIf(stringInput: String) -> Int {
    if let myInteger = Int(stringInput) {
        return myInteger
    }
    return 0
}

print(convertToIntegerIf(stringInput: myNumber))
print(convertToIntegerGuard(stringInput: myNumber))

// Switch
let myNum = 11
let myRemainder = myNum % 2

switch myRemainder {
case 0:
    print("0")
case 1:
    print("1")
case 2:
    print("2")
case 3:
    print("3")
default:
    print("error")
}

switch myRemainder {
case 1...3:
    print("It's 1-3")
default:
    print("None")
}
