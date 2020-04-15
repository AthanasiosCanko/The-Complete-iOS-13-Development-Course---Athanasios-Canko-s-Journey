//
//  ViewController.swift
//  landmarks-app
//
//  Created by Athanasios Canko on 16.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkPhotos = [UIImage]()
    
    var landmarkName = String()
    var landmarkPhoto = UIImage()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkPhotos.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        landmarkName = landmarkNames[indexPath.row]
        landmarkPhoto = landmarkPhotos[indexPath.row]
        
        performSegue(withIdentifier: "secondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.landmarkImage = landmarkPhoto
            secondVC.landmarkName = landmarkName
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkNames = ["Athens", "New York", "Tirana"]
        landmarkPhotos.append(UIImage(named: "athens")!)
        landmarkPhotos.append(UIImage(named: "newyork")!)
        landmarkPhotos.append(UIImage(named: "tirana")!)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

