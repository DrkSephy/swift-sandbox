//
//  ViewController.swift
//  Tinder
//
//  Created by David Leonard on 03/25/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    
   
    @IBOutlet weak var loginCanceledLabel: UILabel!
    
    @IBAction func signIn(sender: AnyObject) {
        var permissions = ["public_profile"]
        self.loginCanceledLabel.alpha = 0;
        
        // Update - added , block:
        
        PFFacebookUtils.logInWithPermissions(permissions, block: {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.");
                self.loginCanceledLabel.alpha = 1;
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!");
                self.performSegueWithIdentifier("signUp", sender: self); // Perform segue
            } else {
                NSLog("User logged in through Facebook!");
                
            }
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if PFUser.currentUser() != nil {
            println("User Logged In");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

