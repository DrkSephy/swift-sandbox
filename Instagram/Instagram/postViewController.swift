//
//  postViewController.swift
//  Instagram
//
//  Created by David Leonard on 3/24/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class postViewController: UIViewController {

    @IBOutlet weak var imageToPost: UIImageView!
    
    @IBAction func chooseImage(sender: AnyObject) {
    }
    
    @IBOutlet weak var shareText: UITextField!
    
    @IBAction func postImage(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
