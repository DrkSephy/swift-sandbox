//
//  ViewController.swift
//  Animations
//
//  Created by David Leonard on 3/19/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alienImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        // Update image on click
        alienImage.image = UIImage(named: "frame2.png");
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

