//
//  ViewController.swift
//  dark-mode-app
//
//  Created by Athanasios Canko on 4.5.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOutlet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
//        let interfaceStyle = traitCollection.userInterfaceStyle
//        
//        if interfaceStyle == .dark {
//            buttonOutlet.setTitleColor(.red, for: UIControl.State.normal)
//        }
//        else {
//            buttonOutlet.setTitleColor(.green, for: UIControl.State.normal)
//        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let interfaceStyle = traitCollection.userInterfaceStyle
               
        if interfaceStyle == .dark {
            buttonOutlet.setTitleColor(.red, for: UIControl.State.normal)
        }
        else {
            buttonOutlet.setTitleColor(.green, for: UIControl.State.normal)
        }
    }


}

