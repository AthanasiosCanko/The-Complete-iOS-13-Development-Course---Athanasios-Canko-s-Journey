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
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsTypeLabel: UILabel!
    @IBOutlet weak var detailsAtmosphereLabel: UILabel!
    @IBOutlet weak var detailsMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(chosenPlaceId)
        
        getDataFromParse()
    }
    
    func getDataFromParse() {
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print(objects)
                if objects != nil {
                    if objects!.count > 0 {
                        let chosenPlaceObject = objects![0]
                        
                        if let placeName = chosenPlaceObject.object(forKey: "name") as? String {
                            self.detailsNameLabel.text = placeName
                        }
                        
                        if let placeType = chosenPlaceObject.object(forKey: "type") as? String {
                            self.detailsTypeLabel.text = placeType
                        }
                        
                        if let placeAtmosphere = chosenPlaceObject.object(forKey: "atmosphere") as? String {
                            self.detailsAtmosphereLabel.text = placeAtmosphere
                        }
                        
                        if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String {
                            if let placeLatitudeDouble = Double(placeLatitude) {
                                self.chosenLatitude = placeLatitudeDouble
                            }
                        }
                        
                        if let placeLongitude = chosenPlaceObject.object(forKey: "longitude") as? String {
                            if let placeLongitudeDouble = Double(placeLongitude) {
                                self.chosenLongitude = placeLongitudeDouble
                            }
                        }
                        
                        if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject {
                            imageData.getDataInBackground { (data, error) in
                                if error == nil {
                                    self.detailsImageView.image = UIImage(data: data!)
                                }
                            }
                        }
                    }
                    
                }
                else {
                    print("No objects.")
                }
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
}
