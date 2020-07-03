//
//  main.swift
//  advanced-swift-project
//
//  Created by Athanasios Canko on 3.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

let classJames = MusicianClass(nameInput: "James", ageInput: 50, instrumentInput: "Guitar")
print(classJames.age)

let structJames = MusicianStruct(name: "James", age: 50, instrument: "Guitar")

print(structJames.name)
