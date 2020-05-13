//
//  ViewController.swift
//  currency-converter
//
//  Created by Athanasios Canko on 12.5.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1. Request & Session
        // 2. Response & Data
        // 3. Parsing
        
        // 1.
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=5c3667174a08de0f3ae53e6091da1930&format=1")
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                
                // 2.
                if data != nil {
                    //
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

