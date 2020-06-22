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

class DetailsVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
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
        detailsMapView.delegate = self
        print(chosenPlaceId)
        
        getDataFromParse()
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = CLLocation(latitude: chosenLatitude, longitude: chosenLongitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if error == nil {
                if placemarks!.count > 0 {
                    let placemark = MKPlacemark(placemark: placemarks![0])
                    let mapItem = MKMapItem(placemark: placemark)
                    mapItem.name = self.detailsNameLabel.text
                    
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                    mapItem.openInMaps(launchOptions: launchOptions)
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }
        else {
            pinView?.annotation = annotation
        }
        
        return pinView
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
                        
                        let coordinate = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        let region = MKCoordinateRegion(center: coordinate, span: span)
                        
                        let annotation = MKPointAnnotation()
                        annotation.title = self.detailsNameLabel.text!
                        annotation.subtitle = self.detailsTypeLabel.text!
                        annotation.coordinate = coordinate
                        
                        self.detailsMapView.setRegion(region, animated: true)
                        self.detailsMapView.addAnnotation(annotation)
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
