//
//  ViewController.swift
//  whack-a-mole
//
//  Created by Athanasios Canko on 15.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 10
    var score = 0
    var highScore = 0
    
    var arrayOfPugs = [UIImageView]()
    var timer = Timer()
    var hideTimer = Timer()

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScorelabel: UILabel!
    
    @IBOutlet weak var pug1: UIImageView!
    @IBOutlet weak var pug2: UIImageView!
    @IBOutlet weak var pug3: UIImageView!
    @IBOutlet weak var pug4: UIImageView!
    @IBOutlet weak var pug5: UIImageView!
    @IBOutlet weak var pug6: UIImageView!
    @IBOutlet weak var pug7: UIImageView!
    @IBOutlet weak var pug8: UIImageView!
    @IBOutlet weak var pug9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pug1.isUserInteractionEnabled = true
        pug2.isUserInteractionEnabled = true
        pug3.isUserInteractionEnabled = true
        pug4.isUserInteractionEnabled = true
        pug5.isUserInteractionEnabled = true
        pug6.isUserInteractionEnabled = true
        pug7.isUserInteractionEnabled = true
        pug8.isUserInteractionEnabled = true
        pug9.isUserInteractionEnabled = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap8 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        let tap9 = UITapGestureRecognizer(target: self, action: #selector(pugTapped))
        
        pug1.addGestureRecognizer(tap1)
        pug2.addGestureRecognizer(tap2)
        pug3.addGestureRecognizer(tap3)
        pug4.addGestureRecognizer(tap4)
        pug5.addGestureRecognizer(tap5)
        pug6.addGestureRecognizer(tap6)
        pug7.addGestureRecognizer(tap7)
        pug8.addGestureRecognizer(tap8)
        pug9.addGestureRecognizer(tap9)
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidePugs), userInfo: nil, repeats: true)
        
        arrayOfPugs = [pug1, pug2, pug3, pug4, pug5, pug6, pug7, pug8, pug9]
        
        if let savedHighScore = UserDefaults.standard.object(forKey: "highScore") as? Int {
            highScore = savedHighScore
            highScorelabel.text = "High Score: \(highScore)"
        }
    }
    
    @objc func hidePugs() {
        for pug in arrayOfPugs {
            pug.isHidden = true
        }
        
        let randomPug = Int(arc4random_uniform(UInt32(arrayOfPugs.count)))
        
        arrayOfPugs[randomPug].isHidden = false
    }
    
    @objc func pugTapped() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = "Time: \(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for pug in arrayOfPugs {
                pug.isHidden = true
            }
            
            if score > highScore {
                highScore = score
                UserDefaults.standard.set(score, forKey: "highScore")
                highScorelabel.text = "High SCore: \(score)"
            }
            
            let alert = UIAlertController(title: "Time's up!", message: "Wanna play again?", preferredStyle: UIAlertController.Style.alert)
            
            let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.counter = 10
                self.score = 0
                
                self.timeLabel.text = "Time: 10"
                self.scoreLabel.text = "Score: 0"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidePugs), userInfo: nil, repeats: true)
            }
            
            alert.addAction(noButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

