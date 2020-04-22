//
//  DetailsViewController.swift
//  artbook-core-data
//
//  Created by Athanasios Canko on 20.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var artistInput: UITextField!
    @IBOutlet weak var yearInput: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let newSubmission = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        let imageData = imageView.image!.jpegData(compressionQuality: 0.7)
        
        newSubmission.setValue(nameInput.text!, forKey: "name")
        newSubmission.setValue(artistInput.text!, forKey: "artist")
        if let year = Int(yearInput.text!) {
            newSubmission.setValue(year, forKey: "year")
        }
        
        newSubmission.setValue(imageData, forKey: "image")
        newSubmission.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("Done")
        }
        catch {
            print("Error")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        view.addGestureRecognizer(tap)
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imageTap)

//        self.nameInput.delegate = self
//        self.artistInput.delegate = self
//        self.yearInput.delegate = self
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
    
    @objc func pickImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
//    @objc func hideKeyboard() {
//        view.endEditing(true)
//    }
}
