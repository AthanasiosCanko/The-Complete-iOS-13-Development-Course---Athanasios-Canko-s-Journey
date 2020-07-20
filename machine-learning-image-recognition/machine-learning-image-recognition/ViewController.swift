//
//  ViewController.swift
//  machine-learning-image-recognition
//
//  Created by Athanasios Canko on 20.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var chosenImage = CIImage()
    
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
            
            if let ciImage = CIImage(image: imageView.image!) {
                chosenImage = ciImage
            }
            
            recognizeImage(image: chosenImage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func recognizeImage(image: CIImage) {
        
        resultLabel.text = "Finding..."
        // 1) Request
        // 2) Handler
        if let model = try? VNCoreMLModel(for: MobileNetV2().model) {
            let request = VNCoreMLRequest(model: model) { (vnrequest, error) in
                if error == nil {
                    if let results = vnrequest.results as? [VNClassificationObservation] {
                        if results.count > 0 {
                            let topResult = results.first
                            
                            DispatchQueue.main.async {
                                //
                                let confidence = (topResult?.confidence ?? 0) * 100
                                let rounded = Int(confidence)
                                self.resultLabel.text = "Confidence: \(rounded) for: \(topResult!.identifier)"
                            }
                        }
                    }
                }
                else {
                    print(error?.localizedDescription)
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async {
                do {
                    try handler.perform([request])
                }
                catch {
                    print("Error")
                }
            }
        }
        
    }
}
