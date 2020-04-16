//
//  main.swift
//  inheritance-and-access-levels
//
//  Created by Athanasios Canko on 16.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

var thano = Human(nameInit: "Thano", ageInit: 24, heightInit: 1.83, weightInit: 65, genderInit: .Male, professionInit: .Executive)

var ariel = SuperHuman(nameInit: "Ariel", ageInit: 48, heightInit: 1.94, weightInit: 110, genderInit: .Male, professionInit: .Warrior)

print(thano.name)

thano.yell()
ariel.yell()

// Access levels
// - private -> can only be accessed inside the class
// - fileprivate -> can only be accessed inside the file
// - internal -> default
// - public -> can be accessed anywhere, but can't be changed
// - open -> can be accessed and changed anywhere
