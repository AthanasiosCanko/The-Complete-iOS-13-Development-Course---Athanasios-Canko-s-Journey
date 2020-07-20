//
//  ViewController.swift
//  machine-learning-image-recognition
//
//  Created by Athanasios Canko on 20.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func changeButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            dismiss(animated: true, completion: nil)
            
            
            
            
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
