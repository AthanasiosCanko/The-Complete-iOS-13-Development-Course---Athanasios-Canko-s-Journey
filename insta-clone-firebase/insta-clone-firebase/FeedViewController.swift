//
//  FeedViewController.swift
//  insta-clone-firebase
//
//  Created by Athanasios Canko on 21.5.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import OneSignal

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()
    
    func getDataFromFirestore() {
        
        let fireStoreDatabase = Firestore.firestore()
        fireStoreDatabase.collection("Posts").order(by: "date", descending: false).addSnapshotListener { (snapshot, error) in
            if error == nil {
                if snapshot != nil {
                    

                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        var documentID = document.documentID
                        self.documentIdArray.append(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                        
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        
                        if let imageUrl = document.get("imageURL") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    
                    print(self.userImageArray)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FeedCell
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.userImageView.sd_setImage(with: URL(string: userImageArray[indexPath.row]), completed: nil)
        cell.documentIdLabel.text = documentIdArray[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirestore()
        
        let status: OSPermissionSubscriptionState = OneSignal.getPermissionSubscriptionState()
        
        if let newPlayerId = status.subscriptionStatus.userId {
            let firestore = Firestore.firestore()
            
            firestore.collection("PlayerId").whereField("email", isEqualTo: Auth.auth().currentUser?.email).getDocuments { (snapshot, error) in
                if error == nil {
                    if snapshot?.isEmpty == false {
                        for document in snapshot!.documents {
                            if let playerIdFromFirestore = document.get("playerId") as? String {
                                let documentId = document.documentID
                                
                                if newPlayerId != playerIdFromFirestore {
                                    
                                    let playerIdDictionary = ["email": Auth.auth().currentUser?.email, "playerId": newPlayerId] as! [String: Any]
                                    
                                    firestore.collection("PlayerId").addDocument(data: playerIdDictionary) { (error) in
                                        if error == nil {
                                            print("Success")
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    else {
                        let playerIdDictionary = ["email": Auth.auth().currentUser?.email, "playerId": newPlayerId] as! [String: Any]
                        
                        firestore.collection("PlayerId").addDocument(data: playerIdDictionary) { (error) in
                            if error == nil {
                                print("Success")
                            }
                        }
                    }
                }
            }
            
//            let playerIdDictionary = ["email": Auth.auth().currentUser?.email, "playerId": newPlayerId] as! [String: Any]
//
//            firestore.collection("PlayerId").addDocument(data: playerIdDictionary) { (error) in
//                if error != nil {
//                    print(error?.localizedDescription)
//                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
//                else {
//                    print("Success")
//                }
//            }
        }
        
//        OneSignal.postNotification([
//            "contents": [
//                "en": "Test Message"
//            ],
//            "include_player_ids": [
//                "6e9ac2a6-089c-4798-87b9-b5a2bb0bac21"
//            ]
//        ])
    }
}
