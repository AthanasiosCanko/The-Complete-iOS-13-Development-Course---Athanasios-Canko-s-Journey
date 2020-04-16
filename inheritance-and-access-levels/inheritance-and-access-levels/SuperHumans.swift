//
//  SuperHumans.swift
//  inheritance-and-access-levels
//
//  Created by Athanasios Canko on 16.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

class SuperHuman: Human {
    override func yell() {
        super.yell()
        print("SPELL ACTIVATED!")
    }
}
