//
//  SecondViewController.swift
//  To Do List
//
//  Created by David Leonard on 3/17/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var item: UITextField!
    @IBAction func addItem(sender: AnyObject) {
        toDoList.append(item.text);
        item.text = "";
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Allows the user to tap outside of the keyboard to close the keyboard down
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder();
        return true;
    }


}

