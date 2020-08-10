//
//  FeedVC.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 22.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snapArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FeedCell
        cell.feedUsernameLabel.text = snapArray[indexPath.row].username
        cell.feedImageView.sd_setImage(with: URL(string: snapArray[indexPath.row].imageUrlArray[0]))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSnap = snapArray[indexPath.row]
        performSegue(withIdentifier: "toSnapVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSnapVC" {
            let snapVC = segue.destination as! SnapVC
            snapVC.selectedSnap = chosenSnap!
        }
    }

    let firestoreDatabase = Firestore.firestore()
    var snapArray = [Snap]()
    var chosenSnap: Snap?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getSnapsFromFirebase()
        getUserInfo()
    }
    
    func getSnapsFromFirebase() {
        firestoreDatabase.collection("Snaps").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            if error == nil {
                if snapshot?.isEmpty == false && snapshot != nil {
                    self.snapArray.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents {
                        let documentId = document.documentID
                        
                        if let username = document.get("snapOwner") as? String {
                            if let imageUrlArray = document.get("imageUrlArray") as? [String] {
                                if let date = document.get("date") as? Timestamp {
                                    
                                    if let difference = Calendar.current.dateComponents([.hour], from: date.dateValue(), to: Date()).hour {
                                        if difference >= 24 {
                                            //
                                            self.firestoreDatabase.collection("Snaps").document(documentId).delete { (error) in
                                                if error != nil {
                                                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                                                }
                                            }
                                        }
                                        else {
                                            let snap = Snap(username: username, imageUrlArray: imageUrlArray, date: date.dateValue(), timeLeft: 24 - difference)
                                            self.snapArray.append(snap)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
            }
            else {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            }
        }
    }
    
    func getUserInfo() {
        firestoreDatabase.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments {(snapshot, error) in
            if error == nil {
                if snapshot?.isEmpty == false && snapshot != nil {
                    for document in snapshot!.documents {
                        if let username = document.get("username") as? String {
                            UserSingleton.sharedUserInfo.username = username
                            UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                            print("success")
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
