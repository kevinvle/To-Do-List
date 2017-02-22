//
//  FirstViewController.swift
//  To Do List
//
//  Created by Kevin Le on 2/18/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//  App using permanent storage 

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var items: [String] = [] // Leave as an empty array if nothing is saved by user
    
  
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count // number of items in our table
    }
    

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row] // We can be sure that items[indexPath.row] is indeed a string because it is of type of an array of strings -> code from above -> var items: [String] = []
        
        return cell
        
    }
    
    
    override func viewDidLoad() { // viewDidLoad is not always called everytime on the app so we use the func viewDidAppear right below this
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) { // Called everytime in the app
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] { // Swift array type
            
            items = tempItems
            
    }
        table.reloadData() // Reloads data
}

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete { // If editingStyle is delete, we want to delete a row
            
            items.remove(at: indexPath.row) // Take items and remove at indexPath.row
            
            table.reloadData() // Reload data
            
            UserDefaults.standard.set(items, forKey: "items") // Save items
            
        }
    }
    
    
    /*
 
 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
 if editingStyle == UITableViewCellEditingStyle.Delete {
 numbers.removeAtIndex(indexPath.row)
 tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
 }
 }
 
 */
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

