//
//  UserSingleton.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 23.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init() {
    }
}
