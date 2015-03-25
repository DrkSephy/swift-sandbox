//
//  ViewController.swift
//  Instagram
//
//  Created by David Leonard on 03/24/15
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var signupActive = true
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title:String, error:String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    
    @IBOutlet var alreadyRegistered: UILabel!
    
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var signUpLabel: UILabel!
    
    @IBOutlet var signUpToggleButton: UIButton!
    
    @IBAction func toggleSignUp(sender: AnyObject) {
        
        if signupActive == true {
            
            signupActive = false
            
            signUpLabel.text = "Use the form below to log in"
            
            signUpButton.setTitle("Log In", forState: UIControlState.Normal)
            
            alreadyRegistered.text = "Not Registered?"
            
            signUpToggleButton.setTitle("Sign Up", forState: UIControlState.Normal)
            
            
        } else {
            
            signupActive = true
            
            signUpLabel.text = "Use the form below to sign up"
            
            signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
            
            alreadyRegistered.text = "Already Registered?"
            
            signUpToggleButton.setTitle("Log In", forState: UIControlState.Normal)
            
            
        }
        
        
    }
    
    @IBAction func signUp(sender: AnyObject) {
        
        var error = ""
        
        if username.text == "" || password.text == "" {
            
            error = "Please enter a username and password"
            
        }
        
        
        if error != "" {
            
            displayAlert("Error In Form", error: error)
            
        } else {
            
            
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50));
            activityIndicator.center = self.view.center;
            activityIndicator.hidesWhenStopped = true;
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray;
            view.addSubview(activityIndicator);
            activityIndicator.startAnimating();
            UIApplication.sharedApplication().beginIgnoringInteractionEvents();
            
            if signupActive == true {
                
                var user = PFUser()
                user.username = username.text
                user.password = password.text
            
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool!, signupError: NSError!) -> Void in
                
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                    if signupError == nil  {
                        // Hooray! Let them use the app now.
                        
                        println("signed up")
                        
                        
                    } else {
                        if let errorString = signupError.userInfo?["error"] as? NSString {
                        
                            // Update - added as! String
                            
                            error = errorString as String
                        
                        } else {
                        
                            error = "Please try again later."
                        
                        }
                    
                        self.displayAlert("Could Not Sign Up", error: error)
                    
                    }
                }
            
            } else {
                
                PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
                    (user: PFUser!, signupError: NSError!) -> Void in
                    
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    if signupError == nil {
                        
                        println("logged in")
                        
                    } else {
                        
                        if let errorString = signupError.userInfo?["error"] as? NSString {
                            
                            // Update - added as! String
                            
                            error = errorString as String
                            
                        } else {
                            
                            error = "Please try again later."
                            
                        }
                        
                        self.displayAlert("Could Not Log In", error: error)
                        
                        
                    }
                }
                
                
            }
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        // Get the details of the user that is currently signed in
        
        println(PFUser.currentUser());
    }
        

    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
             self.performSegueWithIdentifier("jumpToUserTable", sender: self);
        }
    }
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

