//
//  AddPlaceVC.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 12.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class AddPlaceVC: UIViewController {
    
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeDescriptionText: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBAction func nextButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
