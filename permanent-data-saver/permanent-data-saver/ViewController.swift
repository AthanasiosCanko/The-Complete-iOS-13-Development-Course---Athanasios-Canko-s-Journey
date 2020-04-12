//
//  ViewController.swift
//  permanent-data-saver
//
//  Created by Athanasios Canko on 12.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var logLabel: UILabel!
    
    @IBAction func saveButton(_ sender: Any) {
        let name = nameInput.text!
        
        if name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" {
            UserDefaults.standard.set(name, forKey: "name")
            
            resultLabel.text = "Result: \(name)"
            logLabel.text = "Log: Name successfully saved"
        }
        else {
            logLabel.text = "Log: Please type a name."
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "name") != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            
            resultLabel.text = "Result: No name saved."
            logLabel.text = "Log: Name removed successfully."
        }
        else {
            logLabel.text = "Log: There's nothing to remove."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedName = UserDefaults.standard.object(forKey: "name") as? String {
            resultLabel.text = "Result: \(savedName)"
            logLabel.text = "Log: Name loaded from database."
        }
    }
}

