//
//  UploadVC.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 22.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import Firebase

class UploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func uploadClicked(_ sender: Any) {
        let storage = Storage.storage()
        let imageReference = storage.reference().child("media/").child("\(UUID()).jpg")
        
        if let imageData = imageView.image?.jpegData(compressionQuality: 0.8) as? Data {
            imageReference.putData(imageData, metadata: nil) { (metadata, error) in
                if error == nil {
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let firestore = Firestore.firestore()
                            
                            firestore.collection("Snaps").whereField("snapOwner", isEqualTo: UserSingleton.sharedUserInfo.username).getDocuments { (snapshot, error) in
                                if error == nil {
                                    if snapshot?.isEmpty == false && snapshot != nil {
                                        for document in snapshot!.documents {
                                            let documentID = document.documentID
                                            
                                            if var imageUrlArray = document.get("imageUrlArray") as? [String] {
                                                imageUrlArray.append(url!.absoluteString)
                                                
                                                firestore.collection("Snaps").document(documentID).setData(["imageUrlArray": imageUrlArray], merge: true) { (error) in
                                                    if error == nil {
                                                        self.tabBarController?.selectedIndex = 0
                                                        self.imageView.image = UIImage(systemName: "photo")
                                                    }
                                                    else {
                                                        print(error?.localizedDescription)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    else {
                                        let snapDictionary = [
                                            "imageUrlArray": [url!.absoluteString],
                                            "snapOwner": UserSingleton.sharedUserInfo.username,
                                            "date": FieldValue.serverTimestamp()
                                        ] as [String: Any]
            
                                        firestore.collection("Snaps").addDocument(data: snapDictionary) { (error) in
                                            if error == nil {
                                                self.tabBarController?.selectedIndex = 0
                                                self.imageView.image = UIImage(systemName: "photo")
                                            }
                                            else {
                                                print(error?.localizedDescription)
                                            }
                                        }
                                    }
                                }
                                else {
                                    print(error?.localizedDescription ?? "Error")
                                }
                            }
                        }
                        else {
                            print(error?.localizedDescription)
                        }
                    }
                }
                else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imageView.image = pickedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func choosePicture() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}
