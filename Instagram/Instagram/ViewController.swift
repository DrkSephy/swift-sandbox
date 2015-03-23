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
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView();
    
    @IBOutlet weak var pickedImage: UIImageView!
    // This image will prevent the view from closing when the user selects an image, because we overrode the method
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("Image Selected");
        // To close the controller after the user selects an image, we need to do the following:
        self.dismissViewControllerAnimated(true, completion: nil);
        pickedImage.image = image; // Display the picked image
    }
    
    // Pick an image
    @IBAction func pickImage(sender: AnyObject) {
        var image = UIImagePickerController();
        // Set properties for ImagePickerController
        image.delegate = self;
        // The camera roll...
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        // Allows the user to pan/crop before the image is used in the app
        image.allowsEditing = false;
        // Display the picker controller
        self.presentViewController(image, animated: true, completion: nil);
    }
    
    
    // Create a spinning dial on the app while user is waiting
    @IBAction func pause(sender: AnyObject) {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50));
        activityIndicator.center = self.view.center; // Center spinner on screen
        activityIndicator.hidesWhenStopped = true; // Make it disappear when app is stopped
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray; // Color the spinner
        view.addSubview(activityIndicator); // Add spinner
        activityIndicator.startAnimating();
        // Disable the app when paused, user cannot click anything
        // UIApplication.sharedApplication().beginIgnoringInteractionEvents();
    }
    
    @IBAction func restore(sender: AnyObject) {
        activityIndicator.stopAnimating();
        // UIApplication.sharedApplication().endIgnoringInteractionEvents(); // Restart the app
    }
    
    @IBAction func createAlert(sender: AnyObject) {
        var alert = UIAlertController(title: "Hey There!", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert);
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil);
        }));
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Parse.setApplicationId("JfNgWLfYn0peGb6WBOLbjrFLK9wrOqMMdOY6b40n", clientKey: "EeeBNSR3ZwWy26DEXp1H2j4oa2vEVKmKe4jwAAnC");
        
        // Anything with a className of score will have certain characteristics
        // score is now an object - OOP
        /*
        var score = PFObject(className: "score");
        score.setObject("David", forKey: "name"); // Added a new variable to score
        score.setObject(95, forKey: "number");
        score.saveInBackgroundWithBlock { // We needed to bridge the bolts framework to get this to work
            (success: Bool!, error: NSError!) -> Void in
            if success == true {
                println("Score created with ID: \(score.objectId)");
            } else {
                println(error);
            }
        };

        
        // query the "score" class
        var query = PFQuery(className: "score");
        query.getObjectInBackgroundWithId("3YxZuFD1GO") {
            (score: PFObject!, error: NSError!) -> Void in
                if error == nil  {
                    // Get information for one entry
                    // We can also use score["name"] = "Lisa"
                    // println(score.objectForKey("name"));
                    score["name"] = "Lisa";
                    score["number"] = 137;
                    score.save();
                } else {
                    println(error);
                }
        };
        */
        
        // Start importing image from User's Camera role

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

