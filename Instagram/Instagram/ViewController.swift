//
//  ViewController.swift
//  Instagram
//
//  Created by David Leonard on 3/23/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

// UINavigationControllerDelegate allows us to go back and forth between the camera roll/camera and our app
// UIImagePickerControllerDelegate allows the user to select an image
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func signup(sender: AnyObject) {
        var error = "";
        // Check if username/password has not been set
        if username.text == "" || password.text == "" {
            error = "Please enter a username and password";
        }
        
        // If there is an error, throw a message now
        if error != "" {
            var alert = UIAlertController(title: "Error In Form", message: error, preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                self.dismissViewControllerAnimated(true, completion: nil );
            }));
            self.presentViewController(alert, animated: true, completion: nil);
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

