//
//  PlaceModel.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 16.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import Foundation
import UIKit

class PlaceModel {
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeLatitude = ""
    var placeLongitude = ""
    var placeImage = UIImage()
    
    private init() {
        
    }
}
