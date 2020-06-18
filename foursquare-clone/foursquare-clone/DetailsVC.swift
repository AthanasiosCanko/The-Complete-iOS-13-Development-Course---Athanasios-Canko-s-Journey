//
//  DetailsVC.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 15.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import MapKit
import Parse

class DetailsVC: UIViewController {
    
    var chosenPlaceId = ""
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsTypeLabel: UILabel!
    @IBOutlet weak var detailsAtmosphereLabel: UILabel!
    @IBOutlet weak var detailsMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(chosenPlaceId)
        
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print(objects)
            }
            else {
            }
        }
    }
}
