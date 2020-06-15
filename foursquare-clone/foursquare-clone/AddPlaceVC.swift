//
//  AddPlaceVC.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 12.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeDescriptionText: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBAction func nextButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        placeImageView.addGestureRecognizer(tap)
    }
    
    @objc func changeImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            placeImageView.image = image
            self.dismiss(animated: true, completion: nil)
        }
    }
}
