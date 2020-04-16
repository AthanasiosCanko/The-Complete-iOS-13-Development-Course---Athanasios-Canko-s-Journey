//
//  Humans.swift
//  inheritance-and-access-levels
//
//  Created by Athanasios Canko on 16.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

enum Gender {
    case Male
    case Female
    case Other
}

enum Profession {
    case Executive
    case Engineer
    case Scientist
    case Writer
    case Warrior
}

class Human {
    
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    var gender: Gender
    var profession: Profession
    
    init(nameInit: String, ageInit: Int, heightInit: Double, weightInit: Double, genderInit: Gender, professionInit: Profession) {
        name = nameInit
        age = ageInit
        height = heightInit
        weight = weightInit
        gender = genderInit
        profession = professionInit
    }
    
    func yell() {
        print("FUCK YALL!")
    }
}
