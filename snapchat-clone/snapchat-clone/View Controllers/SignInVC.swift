//
//  ViewController.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 22.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (result, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "toFeed", sender: nil)
                }
                else {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Could not sign you in.")
                }
            }
        }
        else {
            self.makeAlert(title: "Error", message: "Username / Password / Email ??")
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" && emailText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (result, error) in
                if error == nil {
                    
                    let firestore = Firestore.firestore()
                    let userDictionary = ["email": self.emailText.text!, "username": self.usernameText.text!] as [String: Any]
                    
                    firestore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error == nil {
                            self.performSegue(withIdentifier: "toFeed", sender: nil)
                        }
                        else {
                            self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Could not save username.")
                        }
                    }
                    
                }
                else {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Could not create user.")
                }
            }
        }
        else {
            makeAlert(title: "Error", message: "Username / Password / Email ??")
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
