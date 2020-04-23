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
    
    var chosenPainting = ""
    var chosenPaintingId: UUID?
    
    @IBAction func saveButton(_ sender: Any) {
        /*
            Context in AppDelegate is responsible for CoreData
            Here we create a context delegate to be able to access CoreData
        */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        /*
            Here we create a new object for the CoreData entity, and store it into the context
        */
        let newSubmission = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        /*
            Here we set values for the new object, namely id, name and artist
        */
        newSubmission.setValue(UUID(), forKey: "id")
        newSubmission.setValue(nameInput.text!, forKey: "name")
        newSubmission.setValue(artistInput.text!, forKey: "artist")
        
        // We validate if the year input is an integer, then we save it
        if let year = Int(yearInput.text!) {
            newSubmission.setValue(year, forKey: "year")
        }
        
        // We convert the image into binary data, and then store it in the object
        let imageData = imageView.image!.jpegData(compressionQuality: 0.7)
        newSubmission.setValue(imageData, forKey: "image")
        
        // We try saving the new object
        do {
            try context.save()
            print("Done")
        }
        catch {
            print("Error")
        }
    
        NotificationCenter.default.post(name: NSNotification.Name.init("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if chosenPainting != "" {
            // Core Data
            let stringUUID = chosenPaintingId!.uuidString
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            fetchRequest.predicate = NSPredicate(format: "id = %@", stringUUID)
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            nameInput.text = name
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            artistInput.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int {
                            yearInput.text = String(year)
                        }
                        
                        if let image = result.value(forKey: "image") as? Data {
                            imageView.image = UIImage(data: image)
                        }
                    }
                }
            }
            catch {
                
            }
        }
        else {
            nameInput.text = ""
            artistInput.text = ""
            yearInput.text = ""
        }
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
