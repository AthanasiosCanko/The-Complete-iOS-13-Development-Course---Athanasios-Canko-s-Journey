//
//  ViewController.swift
//  image-tap-recognizer
//
//  Created by Athanasios Canko on 13.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var toggle = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleImage))
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func toggleImage() {
        if toggle {
            imageView.image = UIImage(named: "greatwall")
        }
        else {
            imageView.image = UIImage(named: "colosseum")
        }
        
        toggle = !toggle
    }


}

