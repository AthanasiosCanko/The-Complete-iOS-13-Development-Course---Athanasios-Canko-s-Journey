//
//  SnapVC.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 22.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class SnapVC: UIViewController {
    
    var selectedSnap: Snap?
    var selectedTime: Int?
    
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let time = selectedTime {
            timeLabel.text = "Time left: \(time)"
        }
    }
}
