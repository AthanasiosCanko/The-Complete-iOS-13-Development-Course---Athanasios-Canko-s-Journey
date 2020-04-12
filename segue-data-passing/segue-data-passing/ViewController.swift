//
//  ViewController.swift
//  segue-data-passing
//
//  Created by Athanasios Canko on 12.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var name = ""
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func segueButton(_ sender: Any) {
        name = nameInput.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if name != "" {
            performSegue(withIdentifier: "secondVC", sender: nil)
            resultLabel.text = "Success."
        }
        else {
            resultLabel.text = "Please type a name."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.name = name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultLabel.text = ""
    }
}
