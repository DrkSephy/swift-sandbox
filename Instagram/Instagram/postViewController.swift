//
//  postViewController.swift
//  Instagram
//
//  Created by David Leonard on 3/24/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class postViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageToPost: UIImageView!
    
    
    
    @IBAction func chooseImage(sender: AnyObject) {
        var image = UIImagePickerController();
        image.delegate = self;
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        image.allowsEditing = false;
        self.presentViewController(image, animated: true, completion: nil);
    }
    
    @IBOutlet weak var shareText: UITextField!
    
    @IBAction func postImage(sender: AnyObject) {
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("Image Selected");
        self.dismissViewControllerAnimated(true, completion: nil);
        imageToPost.image = image;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
