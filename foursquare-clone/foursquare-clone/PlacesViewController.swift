//
//  PlacesViewController.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 12.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Parse

class PlacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var placeNameArray = [String]()
    var placeIdArray = [String]()
    var selectedPlaceId = Int()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placeNameArray[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOut))
        
        getDataFromParse()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlaceId = indexPath.row
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.chosenPlaceId = placeIdArray[selectedPlaceId]
        }
    }
    
    func getDataFromParse() {
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                if objects != nil {
                    
                    self.placeNameArray.removeAll(keepingCapacity: false)
                    self.placeIdArray.removeAll(keepingCapacity: false)
                    
                    for object in objects! {
                        if let placeName = object.object(forKey: "name") as? String {
                            if let placeId = object.objectId {
                                self.placeNameArray.append(placeName)
                                self.placeIdArray.append(placeId)
                            }
                        }
                    }
                    
                    self.tableView.reloadData()
                }
                else {
                    self.makeAlert(title: "Error", message: "No objects found.")
                }
            }
            else {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Could not fetch data.")
            }
        }
    }
    
    @objc func addButtonClicked() {
        //
        self.performSegue(withIdentifier: "addNewPlace", sender: nil)
    }
    
    @objc func logOut() {
        PFUser.logOutInBackground { (error) in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Could not log out.")
            }
            else {
                self.performSegue(withIdentifier: "logOut", sender: nil)
            }
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}
