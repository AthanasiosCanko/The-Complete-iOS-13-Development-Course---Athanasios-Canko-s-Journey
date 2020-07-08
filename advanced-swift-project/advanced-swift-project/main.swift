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

let copyOfClassJames = classJames
var copyOfStructJames = structJames

print(copyOfClassJames.age)
print(copyOfStructJames.age)

copyOfClassJames.age = 52
copyOfStructJames.age = 52

print(copyOfClassJames.age)
print(copyOfStructJames.age)

print(classJames.age)
print(structJames.age)

