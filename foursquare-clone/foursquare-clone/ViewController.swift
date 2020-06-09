//
//  ViewController.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 8.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Apple"
        parseObject["Calories"] = 100
        parseObject.saveInBackground { (success, error) in
            if success == true {
                print("Success")
            }
        }
    }


}

