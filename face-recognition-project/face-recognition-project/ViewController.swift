//
//  ViewController.swift
//  face-recognition-project
//
//  Created by Athanasios Canko on 7.5.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
// We import the library that is responsible for authentications
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBAction func signIn(_ sender: Any) {
        // We create an LAContext object, which contains methods that help with auth
        let authContext = LAContext()
        
        var error: NSError?
        
        // We see if the device can evaluate biometric authentication
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // If so, it evaluates using biometrics (Face ID or Touch ID)
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "secondVC", sender: nil)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.resultLabel.text = "Error!"
                    }
                }
            }
        }
        else {
            resultLabel.text = "Sorry, cannot use biometrics in this device."
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

