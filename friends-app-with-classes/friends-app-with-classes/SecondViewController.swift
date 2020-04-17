//
//  SecondViewController.swift
//  friends-app-with-classes
//
//  Created by Athanasios Canko on 17.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var displayedFriend: Friend?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = displayedFriend?.name
        jobLabel.text = displayedFriend?.job
        imageView.image = displayedFriend?.image
    }
}
