//
//  PlacesViewController.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 12.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Parse

class PlacesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOut))
    }
    
    @objc func addButtonClicked() {
        //
        self.performSegue(withIdentifier: "addNewPlace", sender: nil)
    }
    
    @objc func logOut() {
        PFUser.logOutInBackground { (error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                self.performSegue(withIdentifier: "logOut", sender: nil)
            }
        }
    }
}
