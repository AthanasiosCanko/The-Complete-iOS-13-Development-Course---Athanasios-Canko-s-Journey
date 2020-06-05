//
//  FeedCell.swift
//  insta-clone-firebase
//
//  Created by Athanasios Canko on 27.5.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Firebase
import OneSignal

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var documentIdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes": likeCount + 1] as [String: Any]
            
            firestoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
        
        let email = userEmailLabel.text!
        
        firestoreDatabase.collection("PlayerId").whereField("email", isEqualTo: email).getDocuments { (snapshot, error) in
            if error == nil {
                if snapshot?.isEmpty == false {
                    for document in snapshot!.documents {
                        if let playerId = document.get("playerId") as? String {
                            OneSignal.postNotification([
                                "contents": ["en": "\(email) likes your post."],
                                "include_player_ids": ["\(playerId)"]
                            ])
                            print("Success")
                        }
                    }
                }
            }
        }
    }
    
}
