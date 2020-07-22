//
//  SettingsVC.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 22.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {
    
    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toSignInVC", sender: nil)
        }
        catch {
            //
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
