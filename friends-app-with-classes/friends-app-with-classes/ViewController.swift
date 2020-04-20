//
//  ViewController.swift
//  friends-app-with-classes
//
//  Created by Athanasios Canko on 17.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var chosenFriend: Friend?
    var friendsArray = [Friend]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = friendsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenFriend = friendsArray[indexPath.row]
        performSegue(withIdentifier: "secondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.displayedFriend = chosenFriend
        }
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let xhoi = Friend(nameInit: "Xhoi", jobInit: "Qibyths", imageInit: UIImage(named: "xhoi")!)
        let risi = Friend(nameInit: "Risi", jobInit: "Mami grupit", imageInit: UIImage(named: "risi")!)
        let joni = Friend(nameInit: "Joni", jobInit: "Pjeshka grupit", imageInit: UIImage(named: "joni")!)
        let vali = Friend(nameInit: "Vali", jobInit: "Nuk ka shpjegim", imageInit: UIImage(named: "vali")!)
        let enio = Friend(nameInit: "Enio", jobInit: "Pijanec", imageInit: UIImage(named: "enio")!)
        
        friendsArray.append(xhoi)
        friendsArray.append(risi)
        friendsArray.append(joni)
        friendsArray.append(vali)
        friendsArray.append(enio)
    }
}
