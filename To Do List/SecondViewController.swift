//
//  SecondViewController.swift
//  To Do List
//
//  Created by Kevin Le on 2/18/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var itemTextField: UITextField!
    
    @IBAction func Add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items") // Pull back items from permanent storage
        
        var items: [String] // Use standard array of strings
        
        if let tempItems = itemsObject as? [String] { // Cast as Itemsobject to that type
            
            items = tempItems
            
            items.append(itemTextField.text!) // Array containing a single item: itemTextField.text! forced unwrapped since it's an optional. We know there will be a value though.
            
        } else {
            
            items = [itemTextField.text!] // If that's not the case, create a new array
            
        }
        
        UserDefaults.standard.set(items, forKey: "items") // Save items
        
        itemTextField.text = "" // Reset item text field to empty so user can add multiple items 
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true) // Shuts down keyboard when user taps away
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

