//
//  Friend.swift
//  friends-app-with-classes
//
//  Created by Athanasios Canko on 17.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation
import UIKit

class Friend {
    var name: String
    var job: String
    var image: UIImage
    
    init(nameInit: String, jobInit: String, imageInit: UIImage) {
        name = nameInit
        job = jobInit
        image = imageInit
    }
}
