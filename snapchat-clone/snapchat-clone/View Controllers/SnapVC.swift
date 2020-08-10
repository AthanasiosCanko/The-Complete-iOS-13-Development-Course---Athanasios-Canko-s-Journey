//
//  SnapVC.swift
//  snapchat-clone
//
//  Created by Athanasios Canko on 22.7.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import ImageSlideshow

class SnapVC: UIViewController {
    
    var selectedSnap: Snap?
    var selectedTime: Int?
    var inputArray = [KingfisherSource]()
    
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let snap = selectedSnap {
            for imageUrl in snap.imageUrlArray {
                inputArray.append(KingfisherSource(urlString: imageUrl)!)
            }
            
            timeLabel.text = "Time left: \(snap.timeLeft)"
            
            let imageSlideshow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: view.frame.width * 0.95, height: view.frame.height * 0.9))
            imageSlideshow.backgroundColor = UIColor.white
            
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
            pageIndicator.pageIndicatorTintColor = UIColor.black
            
            imageSlideshow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideshow.setImageInputs(inputArray)
            
            imageSlideshow.pageIndicator = pageIndicator
            
            self.view.addSubview(imageSlideshow)
            self.view.bringSubviewToFront(pageIndicator)
            self.view.bringSubviewToFront(timeLabel)
        }
    }
}
