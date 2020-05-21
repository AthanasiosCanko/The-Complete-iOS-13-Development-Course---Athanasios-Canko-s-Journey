//
//  SettingsViewController.swift
//  insta-clone-firebase
//
//  Created by Athanasios Canko on 21.5.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }
        catch {
            print("Could not log in.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
