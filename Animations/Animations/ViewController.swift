//
//  ViewController.swift
//  Animations
//
//  Created by David Leonard on 3/19/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1;
    @IBOutlet weak var alienImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        if counter == 5 {
            counter = 1;
        } else {
            // Update frame
            counter++;
        }
        // Update image on click
        alienImage.image = UIImage(named: "frame\(counter).png");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        // Make alien appear off the screen, to the left
        // alienImage.center = CGPointMake(alienImage.center.x - 400, alienImage.center.y)
        // Fade image in
        alienImage.alpha = 0;
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: { () -> Void in
           // self.alienImage.center = CGPointMake(self.alienImage.center.x + 400, self.alienImage.center.y);
           // Fade image in
            self.alienImage.alpha = 1; 
        })
    }


}

