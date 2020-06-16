//
//  MapViewController.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 12.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapKit: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let place = PlaceModel.sharedInstance
        print(place.placeName)
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(savePlace))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))
    }
    
    @objc func backButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func savePlace() {
        
    }
}
