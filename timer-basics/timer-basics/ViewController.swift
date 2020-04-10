//
//  ViewController.swift
//  timer-basics
//
//  Created by Athanasios Canko on 10.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 10
    var timer = Timer()
    var countdownStarted = false
    var fruitsArray = [
        "Banana",
        "Cherry",
        "Coconut",
        "Apple",
        "Peach",
        "Grape",
        "Kiwi",
        "Pear",
        "Pineapple",
        "Watermelon",
        "Melon",
        "Orange",
        "Pomegranade",
        "Tangerine",
        "Dragonfruit",
        "Mango"
    ]
    
    @IBOutlet weak var playButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var fruitLabel: UILabel!
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
        countdownStarted = false
        
        statusLabel.text = "Status: Paused"
    }
    
    @IBAction func playButton(_ sender: Any) {
        if countdownStarted == false {
            if counter == 0 {
                let randomNr = Int(arc4random_uniform(UInt32(fruitsArray.count - 1)))
                
                fruitLabel.text = "Fruit of the second: \(fruitsArray[randomNr])"
                
                counter = 10
                timerLabel.text = "Timer: 10"
            }
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
            
            countdownStarted = true
            
            statusLabel.text = "Status: Started"
        }
    }
    
    @objc func countDown() {
        counter -= 1
        timerLabel.text = "Timer: \(counter)"
        
        let randomNr = Int(arc4random_uniform(UInt32(fruitsArray.count - 1)))
        
        fruitLabel.text = "Fruit of the second: \(fruitsArray[randomNr])"
        
        
        
        if counter == 0 {
            timer.invalidate()
            countdownStarted = false
            statusLabel.text = "Status: Finished"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
