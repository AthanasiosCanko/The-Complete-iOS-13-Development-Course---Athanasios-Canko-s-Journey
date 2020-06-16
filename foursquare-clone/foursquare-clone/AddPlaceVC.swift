//
//  AddPlaceVC.swift
//  foursquare-clone
//
//  Created by Athanasios Canko on 12.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

//var globalName = ""
//var globalType = ""
//var globalAtmosphere = ""

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeDescriptionText: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBAction func nextButton(_ sender: Any) {
//        globalName = placeNameText.text!
//        globalType = placeTypeText.text!
//        globalAtmosphere = placeTypeText.text!
        
        if placeNameText.text != "" && placeTypeText.text != "" && placeDescriptionText.text != "" {
            if let chosenImage = placeImageView.image {
                let place = PlaceModel.sharedInstance
                place.placeName = placeNameText.text!
                place.placeType = placeTypeText.text!
                place.placeAtmosphere = placeDescriptionText.text!
                place.placeImage = chosenImage
            }
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Place Name/Type/Atmosphere??", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        
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
