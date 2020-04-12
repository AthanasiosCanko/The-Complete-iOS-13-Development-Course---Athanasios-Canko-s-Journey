//
//  SecondViewController.swift
//  segue-data-passing
//
//  Created by Athanasios Canko on 12.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(name)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
