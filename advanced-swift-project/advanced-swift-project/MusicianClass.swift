//
//  MusicianClass.swift
//  advanced-swift-project
//
//  Created by Athanasios Canko on 3.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

class MusicianClass {
    var name: String
    var age: Int
    var instrument: String
    
    init(nameInput: String, ageInput: Int, instrumentInput: String) {
        self.name = nameInput
        self.age = ageInput
        self.instrument = instrumentInput
    }
    
    func happyBirthday() {
        self.age += 1
    }
}
