//
//  SecondViewController.swift
//  landmarks-app
//
//  Created by Athanasios Canko on 16.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var landmarkImage = UIImage()
    var landmarkName = String()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = landmarkImage
        resultLabel.text = landmarkName
    }
}
