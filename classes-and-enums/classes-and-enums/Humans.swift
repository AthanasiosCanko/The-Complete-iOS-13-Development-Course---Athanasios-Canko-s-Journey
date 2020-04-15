//
//  Humans.swift
//  classes-and-enums
//
//  Created by Athanasios Canko on 16.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

enum Profession {
    case Engineer
    case Executive
    case Designer
    case Painter
}

class Human {
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    var profession: Profession
    
    init(nameInit: String, ageInit: Int, heightInit: Double, weightInit: Double, professionInit: Profession) {
        name = nameInit
        age = ageInit
        height = heightInit
        weight = weightInit
        profession = professionInit
    }
}
