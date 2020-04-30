//
//  ViewController.swift
//  travel-book
//
//  Created by Athanasios Canko on 27.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var chosenTitle = String()
    var chosenTitleId: UUID?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(getLocation(gestureRecognizer:)))
        longPress.minimumPressDuration = 3
        mapView.addGestureRecognizer(longPress)
        
        if chosenTitle != "" {
            print(chosenTitle)
            print(chosenTitleId)
            
            let stringId = chosenTitleId!.uuidString
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            fetchRequest.predicate = NSPredicate(format: "id = %@", stringId)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                let annotation = MKPointAnnotation()
                
                for result in results as! [NSManagedObject] {
                    if let title = result.value(forKey: "title") as? String {
                        annotation.title = title
                        
                        if let subtitle = result.value(forKey: "subtitle") as? String {
                            annotation.subtitle = subtitle
                            
                            if let latitude = result.value(forKey: "latitude") as? Double {
                                chosenLatitude = latitude
                                
                                if let longitude = result.value(forKey: "longitude") as? Double {
                                    chosenLongitude = longitude
                                    
                                    let coordinate = CLLocationCoordinate2D(latitude: chosenLatitude, longitude: chosenLongitude)
                                    annotation.coordinate = coordinate
                                    mapView.addAnnotation(annotation)
                                    
                                    nameText.text = title
                                    commentText.text = subtitle
                                    
                                    locationManager.stopUpdatingLocation()
                                    
                                    let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    mapView.setRegion(region, animated: true)
                                }
                            }
                        }
                    }
                }
            }
            catch {
                //
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if chosenTitle == "" {
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: location, span: span)
            
            mapView.setRegion(region, animated: true)
        }
        
    }
    
    @objc func getLocation(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: self.mapView)
            let coordinates = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = coordinates.latitude
            chosenLongitude = coordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            annotation.coordinate = coordinates
            
            mapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("Success")
        }
        catch {
            print("Error")
        }
    }
}
