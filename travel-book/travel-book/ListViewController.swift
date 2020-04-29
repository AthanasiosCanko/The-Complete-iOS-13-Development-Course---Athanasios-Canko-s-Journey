//
//  ListViewController.swift
//  travel-book
//
//  Created by Athanasios Canko on 29.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titleArray = [String]()
    var idArray = [UUID]()
    
    var selectedTitle = String()
    var selectedTitleId = UUID()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Travel Book"
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewPlace))
        
        getData()
    }
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                titleArray.removeAll(keepingCapacity: false)
                idArray.removeAll(keepingCapacity: false)
                
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "title") as? String {
                        titleArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        idArray.append(id)
                    }
                }
                
                tableView.reloadData()
            }
        }
        catch {
            //
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTitle = titleArray[indexPath.row]
        selectedTitleId = idArray[indexPath.row]
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    @objc func addNewPlace() {
        selectedTitle = ""
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.chosenTitle = selectedTitle
            destinationVC.chosenTitleId = selectedTitleId
        }
    }
}
