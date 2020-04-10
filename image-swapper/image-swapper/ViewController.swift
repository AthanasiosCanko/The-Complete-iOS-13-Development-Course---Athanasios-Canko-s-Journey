//
//  ViewController.swift
//  image-swapper
//
//  Created by Athanasios Canko on 10.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageChanged: Bool = true
    
    @IBOutlet weak var animalDisplayedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func changeImageButton(_ sender: Any) {
        if imageChanged {
            imageView.image = UIImage(named: "dog.png")
            animalDisplayedLabel.text = "Animal Displayed: Dog"
        }
        else {
            imageView.image = UIImage(named: "cat.png")
            animalDisplayedLabel.text = "Animal Displayed: Cat"
        }
        
        imageChanged = !imageChanged
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
