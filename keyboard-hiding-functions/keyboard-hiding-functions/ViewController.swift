//
//  ViewController.swift
//  keyboard-hiding-functions
//
//  Created by Athanasios Canko on 21.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var helloText: UITextField!
    
// -- Method 1
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        helloText.resignFirstResponder()
//        return true
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        helloText.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}

