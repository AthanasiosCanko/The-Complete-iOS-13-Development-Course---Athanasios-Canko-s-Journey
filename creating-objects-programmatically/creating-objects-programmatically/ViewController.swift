//
//  ViewController.swift
//  creating-objects-programmatically
//
//  Created by Athanasios Canko on 13.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let newLabel = UILabel()
    let newButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width
        let height = view.frame.height
        
        newLabel.text = "Hello there!"
        newLabel.textAlignment = .center
        newLabel.textColor = .red
        newLabel.frame = CGRect(x: width * 0.5 - 150, y: height * 0.5 - 75, width: 300, height: 150)
        
        newButton.setTitle("Change text", for: UIControl.State.normal)
        newButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
        newButton.frame = CGRect(x: width * 0.5 - 150, y: height * 0.2 - 75, width: 300, height: 150)
        newButton.addTarget(self, action: #selector(changeText), for: UIControl.Event.touchUpInside)
        
        view.addSubview(newLabel)
        view.addSubview(newButton)
    }
    
    @objc func changeText() {
        newLabel.text = "Text changed!"
    }
}

