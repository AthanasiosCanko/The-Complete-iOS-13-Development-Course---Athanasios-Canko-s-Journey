//
//  ViewController.swift
//  alert-generator
//
//  Created by Athanasios Canko on 12.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var yes: Int = 0
    var no: Int = 0
    
    var foodArray = [
        "Octopus",
        "Squid",
        "Spinach",
        "Quinoa",
        "Beef",
        "Steak",
        "Shrimps",
        "Beans",
        "Tofu",
        "Fish",
        "Salad",
        "Apple",
        "Bread",
        "Milk",
        "Cereals",
        "Biscuits",
        "Chocolate",
        "Cake",
        "Intestines",
        "Lamb",
        "Rabbit"
    ]
    
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    
    @IBAction func generateFoodButton(_ sender: Any) {
        if foodArray.count > 0 {
            let randomNr = Int(arc4random_uniform(UInt32(foodArray.count - 1)))
            let alert = UIAlertController(title: foodArray[randomNr], message: "Like it?", preferredStyle: UIAlertController.Style.alert)
            
            let yesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.yes += 1
                self.yesLabel.text = "Yes: \(self.yes)"
            }
            
            let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive) { (UIAlertAction) in
                self.no += 1
                self.noLabel.text = "No: \(self.no)"
            }
            
            alert.addAction(yesButton)
            alert.addAction(noButton)
            
            self.present(alert, animated: true, completion: nil)
            
            foodArray.remove(at: randomNr)
        }
        else {
            let alert = UIAlertController(title: "Game over", message: "You voted on all foods!", preferredStyle: UIAlertController.Style.alert)
            
            let closeButton = UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(closeButton)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
