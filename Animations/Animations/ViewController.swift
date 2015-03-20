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
    var timer = NSTimer();
    
    @IBOutlet weak var alienImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true);
    }
    
    func doAnimation() {
        if counter == 5 {
            counter = 1;
        } else {
            // Update frame
            counter++;
        }
        // Update image on click
        alienImage.image = UIImage(named: "frame\(counter).png");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func viewDidLayoutSubviews() {
        // Make alien appear off the screen, to the left
        // alienImage.center = CGPointMake(alienImage.center.x - 400, alienImage.center.y)
        // Fade image in
        // alienImage.alpha = 0;
        alienImage.frame = CGRectMake(100, 20, 0, 0);
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: { () -> Void in
           // self.alienImage.center = CGPointMake(self.alienImage.center.x + 400, self.alienImage.center.y);
           // Fade image in
           // self.alienImage.alpha = 1;
            self.alienImage.frame = CGRectMake(100, 20, 100, 200);
        })
    }
    */


}

