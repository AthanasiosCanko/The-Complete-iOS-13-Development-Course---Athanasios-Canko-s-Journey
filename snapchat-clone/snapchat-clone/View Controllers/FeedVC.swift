//
//  FeedVC.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 22.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController {

    let firestoreDatabase = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getUserInfo() {
        firestoreDatabase.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments {(snapshot, error) in
            if error == nil {
                if snapshot?.isEmpty == false && snapshot != nil {
                    for document in snapshot!.documents {
                        if let username = document.get("username") as? String {
                            UserSingleton.sharedUserInfo.username = username
                            UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                        }
                    }
                }
            }
            else {
                self.makeAlert(title: "Hmm...", message: error?.localizedDescription ?? "Could not get user info.")
            }
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
