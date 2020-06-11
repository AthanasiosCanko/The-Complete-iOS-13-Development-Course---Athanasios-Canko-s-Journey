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

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBAction func signIn(_ sender: Any) {
        if usernameText.text! != "" && passwordText.text! != "" {
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { (success, error) in
                if success == true {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
                else {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error signing up.")
                }
            }
        }
        else {
            makeAlert(title: "Error", message: "Username / Password ??")
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let parseObject = PFObject(className: "Fruits")
//        parseObject["name"] = "Banana"
//        parseObject["Calories"] = 150
//        parseObject.saveInBackground { (success, error) in
//            if success == true {
//                print("Success")
//            }
//        }
        
//        let query = PFQuery(className: "Fruits")
//        query.whereKey("name", equalTo: "Apple")
//        query.findObjectsInBackground { (objects, error) in
//            if error == nil {
//                print(objects)
//            }
//            else {
//                print(error?.localizedDescription)
//            }
//        }
        
        
    }


}

