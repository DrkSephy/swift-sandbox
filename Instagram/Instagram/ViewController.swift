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
    
    
    
    @IBOutlet weak var pickedImage: UIImageView!
    
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

